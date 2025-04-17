import 'package:built_collection/built_collection.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final ExpenseFilterBuilder _defaultFilter = ExpenseFilterBuilder();
final ListBuilder<Sort> _defaultSort = ListBuilder<Sort>([
  Sort((builder) {
    builder.property = "paidOn";
    builder.direction = SortDirectionEnum.DESC;
  }),
  Sort((builder) {
    builder.property = "incomingOn";
    builder.direction = SortDirectionEnum.DESC;
  }),
]);

class ExpenseModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final ExpenseApi _expenseApi;

  List<Expense> entities = [];
  Expense? selectedEntity;
  int pageSize = 50;
  ExpenseFilterBuilder filter = _defaultFilter;
  ListBuilder<Sort>? sort = _defaultSort;
  PagingState<int, Expense> pagingState = PagingState();

  ExpenseModel(this._appStateModel, this._expenseApi);

  void getAll() {
    _expenseApi.getExpenses(
      expenseFilterRequest: ExpenseFilterRequest((builder) {
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

    pagingState.copyWith(isLoading: true);
    final nextKey = (pagingState.keys?.last ?? -1) + 1;
    _expenseApi.getExpenses(
      expenseFilterRequest: ExpenseFilterRequest((builder) {
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
        pagingState =
            pagingState.copyWith(
                pages: [...?pagingState.pages],
                keys: [...?pagingState.keys],
                hasNextPage: false, isLoading: false);
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

  Future<void> save(Expense expense) {
    return _expenseApi.saveExpense(expense: expense).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<void> delete(int id) {
    return _expenseApi.deleteExpense(id: id).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
