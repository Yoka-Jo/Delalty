import 'package:delalty/core/app_prefs/app_prefs.dart';
import 'package:delalty/data/requests/get_recently_searched_products_request.dart';
import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_category_usecase.dart';
import 'package:delalty/domain/usecases/get_recently_searched_products_usecase.dart';
import 'package:delalty/domain/usecases/search_for_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base_usecase.dart';
import '../../../../core/services/debouncer.dart';
import '../../../../data/requests/add_product_to_recently_searched_request.dart';
import '../../../../di.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/add_product_to_recently_searched_usecase.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this._searchForProductsUseCase,
    this._addProductToRecentlySearchedUseCase,
    this._getRecentlySearchedProductsUseCase,
    this._getCategoryUseCase,
  ) : super(SearchInitial());
  final SearchForProductsUseCase _searchForProductsUseCase;
  final AddProductToRecentlySearchedUseCase
      _addProductToRecentlySearchedUseCase;
  final GetRecentlySearchedProductsUseCase _getRecentlySearchedProductsUseCase;
  final GetCategoryUseCase _getCategoryUseCase;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  bool isUserSearching = false;
  String searchStr = "";

  void manipulateUserIsSearching(bool isSearching) {
    emit(SearchInitial());
    if (!isSearching && searchStr.isNotEmpty) {
      return;
    }
    isUserSearching = isSearching;
    emit(UserIsSearching());
  }

  List<Product> products = [];
  final debouncer = Debouncer(milliseconds: 500);
  int page = 0;

  Future<void> onSearchChange([String? text]) async {
    if (text != null) {
      searchStr = text;
      products = [];
      page = 0;
    } else {
      page++;
    }
    emit(SearchForProductsLoading());
    debouncer.run(() async {
      final response = await _searchForProductsUseCase(
          SearchForProductsRequest(query: {'q': text, 'page': page}));
      response.fold((l) {
        emit(SearchForProductsFailure(l.message));
      }, (searchedProducts) {
        products.addAll(searchedProducts.products);
        emit(SearchForProductsSuccess());
      });
    });
  }

  List<Product> recentlySearchedProducts = [];

  Future<void> addProductToRecentlySearched(Product product) async {
    emit(AddProductToRecentlySearchedLoading());
    final response = await _addProductToRecentlySearchedUseCase(
      AddProductToRecentlySearchedRequest(product),
    );
    response.fold(
      (l) {
        emit(AddProductToRecentlySearchedFailure(l.message));
      },
      (r) async {
        final response = await _getCategoryUseCase(
            GetCategoryRequest(id: product.categoryId));
        response.fold(
          (l) {},
          (category) {
            recentlySearchedProducts
                .add(product.copyWith(categoryId: category.name));
            emit(AddProductToRecentlySearchedSuccess());
          },
        );
      },
    );
  }

  Future<void> getRecentlySearchedProducts() async {
    emit(GetRecentlySearchedProductsLoading());
    final response = await _getRecentlySearchedProductsUseCase(NoParams());
    response.fold(
      (l) {},
      (products) async {
        recentlySearchedProducts = products;
        emit(GetRecentlySearchedProductsSuccess());
      },
    );
  }
}
