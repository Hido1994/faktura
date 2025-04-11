import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/supplier/supplier_form_screen.dart';
import 'package:faktura/supplier/supplier_list_item.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SupplierModel>(context, listen: false).getAll();
    });

    return CustomScreen(
      title: "Lieferanten",
      form: const SupplierFormScreen(),
      body: Consumer<SupplierModel>(
        builder: (context, model, child) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return SupplierListItem(entry: model.entities[index]);
            },
            itemCount: model.entities.length,
          );
        },
      ),
    );
  }
}
