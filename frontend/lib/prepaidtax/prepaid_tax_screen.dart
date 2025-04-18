import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/prepaidtax/prepaid_tax_filter_screen.dart';
import 'package:faktura/prepaidtax/prepaid_tax_form_screen.dart';
import 'package:faktura/prepaidtax/prepaid_tax_list_item.dart';
import 'package:faktura/prepaidtax/prepaid_tax_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PrepaidTaxScreen extends StatelessWidget {
  const PrepaidTaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "UVA",
      form: const PrepaidTaxFormScreen(),
      filter: const PrepaidTaxFilterScreen(),
      body: Consumer<PrepaidTaxModel>(
        builder: (context, model, child) {
          return PagedListView<int, PrepaidTax>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage: Provider.of<PrepaidTaxModel>(context, listen: false)
                .getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return PrepaidTaxListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
