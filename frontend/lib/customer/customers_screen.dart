import 'package:faktura/common/widget/custom_list_screen.dart';
import 'package:faktura/customer/customer_list_item.dart';
import 'package:faktura/customer/customers_model.dart';
import 'package:faktura/view/screen/form_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widget/custom_drawer.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _MyCustomersScreen();
}

class _MyCustomersScreen extends State<CustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomersModel>(
      create: (context) =>
          CustomersModel(Provider.of<CustomerApi>(context, listen: false)),
      child: CustomListScreen(
        title: "Kunden",
        form: const FormScreen(),
        consumer: Consumer<CustomersModel>(
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
      ),
    );
  }
}
