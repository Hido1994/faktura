import 'package:faktura/account/account_filter_screen.dart';
import 'package:faktura/account/account_form_screen.dart';
import 'package:faktura/account/account_list_item.dart';
import 'package:faktura/account/account_model.dart';
import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Konten",
      form: const AccountFormScreen(),
      filter: const AccountFilterScreen(),
      body: Consumer<AccountModel>(
        builder: (context, model, child) {
          return PagedListView<int, Account>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<AccountModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return AccountListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
