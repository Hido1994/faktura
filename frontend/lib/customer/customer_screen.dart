import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/customer/customer_form_screen.dart';
import 'package:faktura/customer/customer_list_item.dart';
import 'package:faktura/customer/customer_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
          return PagedListView<int, Customer>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
            Provider.of<CustomerModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return CustomerListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
