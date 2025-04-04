import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for PrepaidTaxApi
void main() {
  final instance = FakturaApi().getPrepaidTaxApi();

  group(PrepaidTaxApi, () {
    // Deletes a entity.
    //
    //Future deletePrepaidTax(int id) async
    test('test deletePrepaidTax', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<PrepaidTax> getPrepaidTaxById(int id) async
    test('test getPrepaidTaxById', () async {
      // TODO
    });

    //Future<PrepaidTaxPage> getPrepaidTaxes({ Pageable pageable }) async
    test('test getPrepaidTaxes', () async {
      // TODO
    });

    //Future<PrepaidTax> savePrepaidTax(PrepaidTax prepaidTax) async
    test('test savePrepaidTax', () async {
      // TODO
    });
  });
}
