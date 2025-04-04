import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for FileApi
void main() {
  final instance = FakturaApi().getFileApi();

  group(FileApi, () {
    // Deletes a entity.
    //
    //Future deleteFile(int id) async
    test('test deleteFile', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<File> getFileById(int id) async
    test('test getFileById', () async {
      // TODO
    });

    //Future<FilePage> getFiles({ Pageable pageable }) async
    test('test getFiles', () async {
      // TODO
    });

    //Future<File> saveFile(File file) async
    test('test saveFile', () async {
      // TODO
    });
  });
}
