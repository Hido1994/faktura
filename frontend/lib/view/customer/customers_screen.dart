import 'package:faktura/view/customer/customer_list_item.dart';
import 'package:faktura/view/customer/customers_model.dart';
import 'package:faktura/view/screen/form_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_list_item.dart';
import 'customers_model.dart';

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
      child: Scaffold(
        body: Consumer<CustomersModel>(builder: (context, model, child) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return CustomerListItem(entry: model.entities[index]);
            },
            itemCount: model.entities.length,
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FormScreen()));
          },
          tooltip: 'Neu',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
