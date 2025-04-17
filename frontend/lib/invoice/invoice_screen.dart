import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/invoice/invoice_filter_screen.dart';
import 'package:faktura/invoice/invoice_form_screen.dart';
import 'package:faktura/invoice/invoice_list_item.dart';
import 'package:faktura/invoice/invoice_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Rechnungen",
      form: const InvoiceFormScreen(),
      filter: const InvoiceFilterScreen(),
      body: Consumer<InvoiceModel>(
        builder: (context, model, child) {
          return PagedListView<int, Invoice>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<InvoiceModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return InvoiceListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
