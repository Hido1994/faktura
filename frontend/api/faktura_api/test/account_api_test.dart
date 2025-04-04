import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for AccountApi
void main() {
  final instance = FakturaApi().getAccountApi();

  group(AccountApi, () {
    // Deletes a entity.
    //
    //Future deleteAccount(int id) async
    test('test deleteAccount', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Account> getAccountById(int id) async
    test('test getAccountById', () async {
      // TODO
    });

    //Future<AccountPage> getAccounts({ Pageable pageable }) async
    test('test getAccounts', () async {
      // TODO
    });

    //Future<Account> saveAccount(Account account) async
    test('test saveAccount', () async {
      // TODO
    });
  });
}
