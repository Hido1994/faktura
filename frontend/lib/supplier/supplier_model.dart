import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';

class SupplierModel extends ChangeNotifier {
  final SupplierApi _supplierApi;

  List<Supplier> entities = [];
  Supplier? selectedEntity;

  SupplierModel(this._supplierApi) {
    getAll();
  }

  void getAll() {
    _supplierApi.getSuppliers().then((response) {
      print(response);
      entities = response.data?.content?.toList() ?? [];
      notifyListeners();
    }).catchError((error) {
      print("test");
      print(error);
    });
  }

  Future<Null> save(Supplier supplier) {
    return _supplierApi.saveSupplier(supplier: supplier).then((response) {
      getAll();
      notifyListeners();
    });
  }
}
