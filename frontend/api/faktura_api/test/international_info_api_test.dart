import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for InternationalInfoApi
void main() {
  final instance = FakturaApi().getInternationalInfoApi();

  group(InternationalInfoApi, () {
    // Deletes a entity.
    //
    //Future deleteInternationalInfo(int id) async
    test('test deleteInternationalInfo', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<InternationalInfo> getInternationalInfoById(int id) async
    test('test getInternationalInfoById', () async {
      // TODO
    });

    //Future<InternationalInfoPage> getInternationalInfos({ Pageable pageable }) async
    test('test getInternationalInfos', () async {
      // TODO
    });

    //Future<InternationalInfo> saveInternationalInfo(InternationalInfo internationalInfo) async
    test('test saveInternationalInfo', () async {
      // TODO
    });
  });
}
