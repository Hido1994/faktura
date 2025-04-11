import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/customer/customer_form_screen.dart';
import 'package:faktura/customer/customer_list_item.dart';
import 'package:faktura/customer/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CustomerModel>(context, listen: false).getAll();
    });

    return CustomScreen(
      title: "Kunden",
      form: const CustomerFormScreen(),
      body: Consumer<CustomerModel>(
        builder: (context, model, child) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return CustomerListItem(entry: model.entities[index]);
            },
            itemCount: model.entities.length,
          );
        },
      ),
    );
  }
}
