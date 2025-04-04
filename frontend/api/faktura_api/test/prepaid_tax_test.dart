import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

// tests for PrepaidTax
void main() {
  final instance = PrepaidTaxBuilder();
  // TODO add properties to the builder and call build()

  group(PrepaidTax, () {
    // Primary key identifier for the prepaid tax
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // Tax year
    // int taxYear
    test('to test the property `taxYear`', () async {
      // TODO
    });

    // Quarter of the tax year
    // int taxQuarter
    test('to test the property `taxQuarter`', () async {
      // TODO
    });

    // Calculated prepaid tax amount
    // double taxCalculated
    test('to test the property `taxCalculated`', () async {
      // TODO
    });

    // Surplus amount in the tax account
    // double accountSurplus
    test('to test the property `accountSurplus`', () async {
      // TODO
    });

    // Cash transfer amount
    // double cashTransfer
    test('to test the property `cashTransfer`', () async {
      // TODO
    });

    // Additional notes about the prepaid tax
    // String note
    test('to test the property `note`', () async {
      // TODO
    });
  });
}
