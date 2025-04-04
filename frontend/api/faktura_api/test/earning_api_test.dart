import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for EarningApi
void main() {
  final instance = FakturaApi().getEarningApi();

  group(EarningApi, () {
    // Deletes a entity.
    //
    //Future deleteEarning(int id) async
    test('test deleteEarning', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Earning> getEarningById(int id) async
    test('test getEarningById', () async {
      // TODO
    });

    //Future<EarningPage> getEarnings({ Pageable pageable }) async
    test('test getEarnings', () async {
      // TODO
    });

    //Future<Earning> saveEarning(Earning earning) async
    test('test saveEarning', () async {
      // TODO
    });
  });
}
