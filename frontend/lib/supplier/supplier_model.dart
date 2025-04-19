import 'package:built_collection/built_collection.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

SupplierFilterBuilder _defaultFilter = SupplierFilterBuilder();
ListBuilder<Sort>? _defaultSort = ListBuilder<Sort>([
  Sort((builder) {
    builder.property = "name";
    builder.direction = SortDirectionEnum.ASC;
  }),
]);

class SupplierModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final SupplierApi _supplierApi;

  List<Supplier> lovEntities = [];
  Supplier? selectedEntity;
  int pageSize = 50;
  SupplierFilterBuilder filter = _defaultFilter;
  ListBuilder<Sort>? sort = _defaultSort;
  PagingState<int, Supplier> pagingState = PagingState();

  SupplierModel(this._appStateModel, this._supplierApi);

  void initData() {
    _supplierApi.getSuppliers(
      supplierFilterRequest: SupplierFilterRequest((builder) {
        builder.filter = _defaultFilter;
        builder.pageable = Pageable((builder) {
          builder.sort = _defaultSort;
        }).toBuilder();
      }),
    ).then((response) {
      lovEntities = response.data?.content?.toList() ?? [];
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  void refresh() {
    pagingState = PagingState();
    notifyListeners();
  }

  void getNextPage() {
    if (pagingState.isLoading) {
      return;
    }

    pagingState.copyWith(isLoading: true);
    final nextKey = (pagingState.keys?.last ?? -1) + 1;
    _supplierApi.getSuppliers(
      supplierFilterRequest: SupplierFilterRequest((builder) {
        builder.filter = filter;
        builder.pageable = Pageable((builder) {
          builder.pageNumber = nextKey;
          builder.pageSize = pageSize;
          builder.sort = sort;
        }).toBuilder();
      }),
    ).then((response) {
      final pageItems = response.data?.content?.toList() ?? [];
      if (pageItems.isEmpty) {
        pagingState = pagingState.copyWith(
            pages: [...?pagingState.pages],
            keys: [...?pagingState.keys],
            hasNextPage: false,
            isLoading: false);
      } else {
        pagingState = pagingState.copyWith(
            pages: [...?pagingState.pages, pageItems],
            keys: [...?pagingState.keys, nextKey],
            isLoading: false);
      }
      notifyListeners();
    }).catchError((error) {
      pagingState = pagingState.copyWith(isLoading: false, error: error);
      notifyListeners();
    });
  }

  Future<void> save(Supplier supplier) {
    return _supplierApi.saveSupplier(supplier: supplier).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<void> delete(int id) {
    return _supplierApi.deleteSupplier(id: id).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
