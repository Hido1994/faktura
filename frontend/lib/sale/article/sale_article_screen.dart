import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/sale/article/sale_article_filter_screen.dart';
import 'package:faktura/sale/article/sale_article_form_screen.dart';
import 'package:faktura/sale/article/sale_article_list_item.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SaleArticleScreen extends StatelessWidget {
  const SaleArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Waren",
      form: const SaleArticleFormScreen(),
      filter: const SaleArticleFilterScreen(),
      body: Consumer<SaleArticleModel>(
        builder: (context, model, child) {
          return PagedListView<int, SaleArticle>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage: Provider.of<SaleArticleModel>(context, listen: false)
                .getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return SaleArticleListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
