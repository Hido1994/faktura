import 'package:faktura/paymentmethod/payment_method_filter_screen.dart';
import 'package:faktura/paymentmethod/payment_method_form_screen.dart';
import 'package:faktura/paymentmethod/payment_method_list_item.dart';
import 'package:faktura/paymentmethod/payment_method_model.dart';
import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Zahlarten",
      form: const PaymentMethodFormScreen(),
      filter: const PaymentMethodFilterScreen(),
      body: Consumer<PaymentMethodModel>(
        builder: (context, model, child) {
          return PagedListView<int, PaymentMethod>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<PaymentMethodModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return PaymentMethodListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
