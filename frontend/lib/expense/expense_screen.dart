import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/expense/expense_filter_screen.dart';
import 'package:faktura/expense/expense_form_screen.dart';
import 'package:faktura/expense/expense_list_item.dart';
import 'package:faktura/expense/expense_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Ausgaben",
      form: const ExpenseFormScreen(),
      filter: const ExpenseFilterScreen(),
      body: Consumer<ExpenseModel>(
        builder: (context, model, child) {
          return PagedListView<int, Expense>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<ExpenseModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return ExpenseListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
