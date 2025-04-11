import 'package:built_collection/built_collection.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomerModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final CustomerApi _customerApi;

  List<Customer> entities = [];
  Customer? selectedEntity;
  int pageSize = 50;
  ListBuilder<Sort>? sort = ListBuilder<Sort>([
    Sort((builder) {
      builder.property = "name";
      builder.direction = SortDirectionEnum.ASC;
    }),
  ]);
  PagingState<int, Customer> pagingState = PagingState();

  CustomerModel(this._appStateModel, this._customerApi);

  void getAll() {
    _appStateModel.setLoading(true);
    _customerApi.getCustomers(pageable: Pageable((builder) {
      builder.sort = sort;
    })).then((response) {
      entities = response.data?.content?.toList() ?? [];
      notifyListeners();
      _appStateModel.setLoading(false);
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  void getNextPage() {
    if (pagingState.isLoading) {
      return;
    }

    pagingState.copyWith(isLoading: true);
    final nextKey = (pagingState.keys?.last ?? -1) + 1;
    _customerApi.getCustomers(pageable: Pageable((builder) {
      builder.pageNumber = nextKey;
      builder.pageSize = pageSize;
      builder.sort = sort;
    })).then((response) {
      final pageItems = response.data?.content?.toList() ?? [];
      if (pageItems.isEmpty) {
        pagingState =
            pagingState.copyWith(hasNextPage: false, isLoading: false);
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

  Future<void> save(Customer customer) {
    _appStateModel.setLoading(true);
    return _customerApi.saveCustomer(customer: customer).then((response) {
      getAll();
    }).catchError((error) {
      _appStateModel.setLoading(false);
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
