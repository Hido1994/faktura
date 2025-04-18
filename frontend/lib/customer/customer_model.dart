import 'package:built_collection/built_collection.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

CustomerFilterBuilder _defaultFilter = CustomerFilterBuilder();
ListBuilder<Sort>? _defaultSort = ListBuilder<Sort>([
  Sort((builder) {
    builder.property = "name";
    builder.direction = SortDirectionEnum.ASC;
  }),
]);

class CustomerModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final CustomerApi _customerApi;

  List<Customer> entities = [];
  Customer? selectedEntity;
  int pageSize = 50;
  CustomerFilterBuilder filter = _defaultFilter;
  ListBuilder<Sort>? sort = _defaultSort;
  PagingState<int, Customer> pagingState = PagingState();

  CustomerModel(this._appStateModel, this._customerApi);

  void getAll() {
    _customerApi.getCustomers(
      customerFilterRequest: CustomerFilterRequest((builder) {
        builder.filter = _defaultFilter;
        builder.pageable = Pageable((builder) {
          builder.sort = _defaultSort;
        }).toBuilder();
      }),
    ).then((response) {
      entities = response.data?.content?.toList() ?? [];
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

    pagingState = pagingState.copyWith(isLoading: true);
    final nextKey = (pagingState.keys?.last ?? -1) + 1;
    _customerApi.getCustomers(
      customerFilterRequest: CustomerFilterRequest((builder) {
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

  Future<void> save(Customer customer) {
    return _customerApi.saveCustomer(customer: customer).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<void> delete(int id) {
    return _customerApi.deleteCustomer(id: id).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
