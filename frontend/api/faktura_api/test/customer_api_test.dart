import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for CustomerApi
void main() {
  final instance = FakturaApi().getCustomerApi();

  group(CustomerApi, () {
    // Deletes a entity.
    //
    //Future deleteCustomer(int id) async
    test('test deleteCustomer', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Customer> getCustomerById(int id) async
    test('test getCustomerById', () async {
      // TODO
    });

    //Future<CustomerPage> getCustomers({ Pageable pageable }) async
    test('test getCustomers', () async {
      // TODO
    });

    //Future<Customer> saveCustomer(Customer customer) async
    test('test saveCustomer', () async {
      // TODO
    });
  });
}
