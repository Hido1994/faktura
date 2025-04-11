import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';


class SupplierModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final SupplierApi _supplierApi;

  List<Supplier> entities = [];
  Supplier? selectedEntity;

  SupplierModel(this._appStateModel, this._supplierApi);

  void getAll() {
    _appStateModel.setLoading(true);
    _supplierApi.getSuppliers(
      pageable: Pageable((builder) {
        builder.pageNumber = 1;
        builder.sort = ListBuilder<Sort>([
          Sort((builder) {
            builder.property = "name";
            builder.direction = SortDirectionEnum.ASC;
          }),
        ]);
      }),
    ).then((response) {
      entities = response.data?.content?.toList() ?? [];
      notifyListeners();
      _appStateModel.setLoading(false);
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<Null> save(Supplier supplier) {
    _appStateModel.setLoading(true);
    return _supplierApi.saveSupplier(supplier: supplier).then((response) {
      getAll();
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
