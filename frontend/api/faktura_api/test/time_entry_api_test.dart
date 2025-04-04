import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for TimeEntryApi
void main() {
  final instance = FakturaApi().getTimeEntryApi();

  group(TimeEntryApi, () {
    // Deletes a entity.
    //
    //Future deleteTimeEntry(int id) async
    test('test deleteTimeEntry', () async {
      // TODO
    });

    //Future<TimeEntryPage> getTimeEntries({ Pageable pageable }) async
    test('test getTimeEntries', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<TimeEntry> getTimeEntryById(int id) async
    test('test getTimeEntryById', () async {
      // TODO
    });

    //Future<TimeEntry> saveTimeEntry(TimeEntry timeEntry) async
    test('test saveTimeEntry', () async {
      // TODO
    });
  });
}
