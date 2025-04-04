import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for PaymentMethodApi
void main() {
  final instance = FakturaApi().getPaymentMethodApi();

  group(PaymentMethodApi, () {
    // Deletes a entity.
    //
    //Future deletePaymentMethod(int id) async
    test('test deletePaymentMethod', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<PaymentMethod> getPaymentMethodById(int id) async
    test('test getPaymentMethodById', () async {
      // TODO
    });

    //Future<PaymentMethodPage> getPaymentMethods({ Pageable pageable }) async
    test('test getPaymentMethods', () async {
      // TODO
    });

    //Future<PaymentMethod> savePaymentMethod(PaymentMethod paymentMethod) async
    test('test savePaymentMethod', () async {
      // TODO
    });
  });
}
