import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/supplier/supplier_form_screen.dart';
import 'package:faktura/supplier/supplier_list_item.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Lieferanten",
      form: const SupplierFormScreen(),
      body: Consumer<SupplierModel>(
        builder: (context, model, child) {
          return PagedListView<int, Supplier>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<SupplierModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return SupplierListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
