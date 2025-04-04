import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for SaleServiceApi
void main() {
  final instance = FakturaApi().getSaleServiceApi();

  group(SaleServiceApi, () {
    // Deletes a entity.
    //
    //Future deleteSaleService(int id) async
    test('test deleteSaleService', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<SaleService> getSaleServiceById(int id) async
    test('test getSaleServiceById', () async {
      // TODO
    });

    //Future<SaleServicePage> getSaleServices({ Pageable pageable }) async
    test('test getSaleServices', () async {
      // TODO
    });

    //Future<SaleService> saveSaleService(SaleService saleService) async
    test('test saveSaleService', () async {
      // TODO
    });
  });
}
