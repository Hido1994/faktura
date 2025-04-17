import 'package:built_collection/built_collection.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SaleArticleModel extends ChangeNotifier {
  final AppStateModel _appStateModel;
  final SaleArticleApi _saleArticleApi;

  List<SaleArticle> entities = [];
  SaleArticle? selectedEntity;
  int pageSize = 50;
  SaleArticleFilterBuilder filter = SaleArticleFilterBuilder();
  ListBuilder<Sort>? sort = ListBuilder<Sort>([
    Sort((builder) {
      builder.property = "paidOn";
      builder.direction = SortDirectionEnum.DESC;
    }),
    Sort((builder) {
      builder.property = "incomingOn";
      builder.direction = SortDirectionEnum.DESC;
    }),
  ]);
  PagingState<int, SaleArticle> pagingState = PagingState();

  SaleArticleModel(this._appStateModel, this._saleArticleApi);

  void getAll() {
    _appStateModel.setLoading(true);
    _saleArticleApi.getSaleArticles(
      saleArticleFilterRequest: SaleArticleFilterRequest((builder) {
        builder.filter = filter;
        builder.pageable = Pageable((builder) {
          builder.sort = sort;
        }).toBuilder();
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
    _saleArticleApi.getSaleArticles(
      saleArticleFilterRequest: SaleArticleFilterRequest((builder) {
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

  Future<void> save(SaleArticle saleArticle) {
    return _saleArticleApi
        .saveSaleArticle(saleArticle: saleArticle)
        .then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }

  Future<void> delete(int id) {
    return _saleArticleApi.deleteSaleArticle(id: id).then((response) {
      refresh();
    }).catchError((error) {
      _appStateModel.setMessage("Ein unerwarteter Fehler ist aufgetreten.");
    });
  }
}
