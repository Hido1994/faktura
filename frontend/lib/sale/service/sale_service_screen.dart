import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/sale/service/sale_service_filter_screen.dart';
import 'package:faktura/sale/service/sale_service_form_screen.dart';
import 'package:faktura/sale/service/sale_service_list_item.dart';
import 'package:faktura/sale/service/sale_service_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SaleServiceScreen extends StatelessWidget {
  const SaleServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Dienstleistungen",
      form: const SaleServiceFormScreen(),
      filter: const SaleServiceFilterScreen(),
      body: Consumer<SaleServiceModel>(
        builder: (context, model, child) {
          return PagedListView<int, SaleService>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage: Provider.of<SaleServiceModel>(context, listen: false)
                .getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return SaleServiceListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
