import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for SettingApi
void main() {
  final instance = FakturaApi().getSettingApi();

  group(SettingApi, () {
    // Deletes a entity.
    //
    //Future deleteSetting(int id) async
    test('test deleteSetting', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Setting> getSettingById(int id) async
    test('test getSettingById', () async {
      // TODO
    });

    //Future<SettingPage> getSettings({ Pageable pageable }) async
    test('test getSettings', () async {
      // TODO
    });

    //Future<Setting> saveSetting(Setting setting) async
    test('test saveSetting', () async {
      // TODO
    });
  });
}
