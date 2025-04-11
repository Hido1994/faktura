import 'package:flutter/material.dart';

class AppStateModel extends ChangeNotifier {
  bool loading = false;
  String? message;

  void setLoading(loading) {
    this.loading = loading;
    notifyListeners();
  }

  void setMessage(message) {
    this.message = message;
    notifyListeners();
  }
}
