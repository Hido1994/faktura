import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for SupplierApi
void main() {
  final instance = FakturaApi().getSupplierApi();

  group(SupplierApi, () {
    // Deletes a entity.
    //
    //Future deleteSupplier(int id) async
    test('test deleteSupplier', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Supplier> getSupplierById(int id) async
    test('test getSupplierById', () async {
      // TODO
    });

    //Future<SupplierPage> getSuppliers({ Pageable pageable }) async
    test('test getSuppliers', () async {
      // TODO
    });

    //Future<Supplier> saveSupplier(Supplier supplier) async
    test('test saveSupplier', () async {
      // TODO
    });
  });
}
