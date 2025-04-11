import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';

class CustomerModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final CustomerApi _customerApi;

  List<Customer> entities = [];
  Customer? selectedEntity;

  CustomerModel(this._appStateModel, this._customerApi);

  void getAll() {
    _appStateModel.setLoading(true);
    _customerApi.getCustomers().then((response) {
      entities = response.data?.content?.toList() ?? [];
      notifyListeners();
      _appStateModel.setLoading(false);
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<Null> save(Customer customer) {
    _appStateModel.setLoading(true);
    return _customerApi.saveCustomer(customer: customer).then((response) {
      getAll();
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
