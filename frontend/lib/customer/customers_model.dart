import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';

class CustomersModel extends ChangeNotifier {
  final CustomerApi _customerApi;

  List<Customer> entities = [];

  CustomersModel(this._customerApi) {
    getAll();
  }

  void getAll() {
    _customerApi.getCustomers().then((response) {
      entities = response.data?.content?.toList() ?? [];
      notifyListeners();
    });
  }
}
