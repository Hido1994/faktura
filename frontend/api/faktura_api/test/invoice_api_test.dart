import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for InvoiceApi
void main() {
  final instance = FakturaApi().getInvoiceApi();

  group(InvoiceApi, () {
    // Deletes a entity.
    //
    //Future deleteInvoice(int id) async
    test('test deleteInvoice', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Invoice> getInvoiceById(int id) async
    test('test getInvoiceById', () async {
      // TODO
    });

    //Future<InvoicePage> getInvoices({ Pageable pageable }) async
    test('test getInvoices', () async {
      // TODO
    });

    //Future<Invoice> saveInvoice(Invoice invoice) async
    test('test saveInvoice', () async {
      // TODO
    });
  });
}
