import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/internationalinfo/international_info_filter_screen.dart';
import 'package:faktura/internationalinfo/international_info_form_screen.dart';
import 'package:faktura/internationalinfo/international_info_list_item.dart';
import 'package:faktura/internationalinfo/international_info_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class InternationalInfoScreen extends StatelessWidget {
  const InternationalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Internationl Info",
      form: const InternationalInfoFormScreen(),
      filter: const InternationalInfoFilterScreen(),
      body: Consumer<InternationalInfoModel>(
        builder: (context, model, child) {
          return PagedListView<int, InternationalInfo>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<InternationalInfoModel>(context, listen: false)
                    .getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return InternationalInfoListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
