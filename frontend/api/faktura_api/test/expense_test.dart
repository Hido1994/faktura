import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

// tests for Expense
void main() {
  final instance = ExpenseBuilder();
  // TODO add properties to the builder and call build()

  group(Expense, () {
    // Primary key identifier for the expense
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // Date when the expense was received
    // Date incomingOn
    test('to test the property `incomingOn`', () async {
      // TODO
    });

    // Description of the expense
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Net price of the expense
    // double priceNet
    test('to test the property `priceNet`', () async {
      // TODO
    });

    // Tax amount of the expense
    // double priceTax
    test('to test the property `priceTax`', () async {
      // TODO
    });

    // Account account
    test('to test the property `account`', () async {
      // TODO
    });

    // Date when the expense was paid
    // Date paidOn
    test('to test the property `paidOn`', () async {
      // TODO
    });

    // PaymentMethod paymentMethod
    test('to test the property `paymentMethod`', () async {
      // TODO
    });

    // Supplier supplier
    test('to test the property `supplier`', () async {
      // TODO
    });

    // InternationalInfo internationalInfo
    test('to test the property `internationalInfo`', () async {
      // TODO
    });

    // Additional notes about the expense
    // String note
    test('to test the property `note`', () async {
      // TODO
    });

    // Number of years for tax depreciation
    // int depreciationYears
    test('to test the property `depreciationYears`', () async {
      // TODO
    });
  });
}
