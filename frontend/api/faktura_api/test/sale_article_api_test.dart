import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for SaleArticleApi
void main() {
  final instance = FakturaApi().getSaleArticleApi();

  group(SaleArticleApi, () {
    // Deletes a entity.
    //
    //Future deleteSaleArticle(int id) async
    test('test deleteSaleArticle', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<SaleArticle> getSaleArticleById(int id) async
    test('test getSaleArticleById', () async {
      // TODO
    });

    //Future<SaleArticlePage> getSaleArticles({ Pageable pageable }) async
    test('test getSaleArticles', () async {
      // TODO
    });

    //Future<SaleArticle> saveSaleArticle(SaleArticle saleArticle) async
    test('test saveSaleArticle', () async {
      // TODO
    });
  });
}
