import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static final PreferenceService instance =
      PreferenceService._privateConstructor();

  PreferenceService._privateConstructor();

  Future<String> getDatabasePath() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('db_path')) {
      return prefs.getString('db_path')!;
    } else {
      return join((await getApplicationDocumentsDirectory()).path, 'trips.db');
    }
  }

  Future<void> saveDatabasePath(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('db_path', value);
  }


  Future<String> getApiBaseUrl() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('api_base_path')) {
      return prefs.getString('api_base_path')!;
    } else {
      return "http://localhost:8080/api/v1";
    }
  }

  Future<void> saveApiBaseUrl(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('api_base_path', value);
  }
}
