import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

// tests for Invoice
void main() {
  final instance = InvoiceBuilder();
  // TODO add properties to the builder and call build()

  group(Invoice, () {
    // Primary key identifier for the invoice
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // Subject of the invoice
    // String subject
    test('to test the property `subject`', () async {
      // TODO
    });

    // Date when the invoice was created
    // Date createdOn
    test('to test the property `createdOn`', () async {
      // TODO
    });

    // Invoice number
    // int invoiceNumber
    test('to test the property `invoiceNumber`', () async {
      // TODO
    });

    // Date when the invoice was paid
    // Date paidOn
    test('to test the property `paidOn`', () async {
      // TODO
    });

    // PaymentMethod paymentMethod
    test('to test the property `paymentMethod`', () async {
      // TODO
    });

    // Customer customer
    test('to test the property `customer`', () async {
      // TODO
    });

    // Period of service covered by the invoice
    // String servicePeriod
    test('to test the property `servicePeriod`', () async {
      // TODO
    });

    // Revision information for the invoice
    // String revision
    test('to test the property `revision`', () async {
      // TODO
    });
  });
}
