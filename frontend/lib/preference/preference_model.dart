import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceModel extends ChangeNotifier {
  final SharedPreferencesWithCache sharedPreferences;
  String apiUrl;

  PreferenceModel(this.sharedPreferences)
      : apiUrl =
            sharedPreferences.getString('api-url') ?? 'http://localhost:8080/api/v1';

  void setApiUrl(String value) {
    sharedPreferences.setString('api-url', value);
    apiUrl = value;
    notifyListeners();
  }
}
