import 'dart:developer';

import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_category_usecase.dart';
import 'package:delalty/domain/usecases/get_recently_searched_products_usecase.dart';
import 'package:delalty/domain/usecases/search_for_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../core/base_usecase.dart';
import '../../../../core/services/debouncer.dart';
import '../../../../data/requests/add_product_to_recently_searched_request.dart';
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
  final TextEditingController searchController = TextEditingController();
  final SpeechToText speechToText = SpeechToText();

  bool isListening = false;

  Future<void> listeningForSpeech() async {
    emit(SearchInitial());
    if (!isListening) {
      var available = await speechToText.initialize();
      if (available) {
        isListening = true;
        emit(SearchChangeIsListeningForSpeech());
        speechToText.listen(
          onResult: (result) async {
            searchController.text = result.recognizedWords;
            emit(SearchSpeechChanges());
          },
        );
      }
    }
  }

  Future<void> finishListeningForSpeech() async {
    emit(SearchInitial());
    isListening = false;
    speechToText.stop();
    emit(SearchChangeIsListeningForSpeech());
    manipulateUserIsSearching(true);
    await onSearchChange(searchController.text);
  }

  void manipulateUserIsSearching(bool isSearching) {
    emit(SearchInitial());
    if (!isSearching && searchStr.isNotEmpty) {
      return;
    }
    if (searchStr.isEmpty) {
      clearProducts();
    }
    isUserSearching = isSearching;
    emit(UserIsSearching());
  }

  void clearProducts() => products.clear();
  void clearController() => searchController.clear();
  void clearForNavigation() {
    emit(SearchInitial());
    clearProducts();
    clearController();
    isUserSearching = false;
    emit(SearchClearForNavigation());
  }

  List<Product> products = [];
  final debouncer = Debouncer(milliseconds: 500);
  int page = 0;

  Future<void> onSearchChange([String? text]) async {
    if (text != null) {
      if (text.isEmpty) {
        clearProducts();
        manipulateUserIsSearching(false);
      } else {
        manipulateUserIsSearching(true);
      }

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

    final response =
        await _getCategoryUseCase(GetCategoryRequest(id: product.categoryId));
    response.fold(
      (l) {},
      (category) async {
        product = product.copyWith(categoryId: category.name);
        final response = await _addProductToRecentlySearchedUseCase(
          AddProductToRecentlySearchedRequest(product),
        );
        response.fold(
          (l) {
            emit(AddProductToRecentlySearchedFailure(l.message));
          },
          (r) async {
            recentlySearchedProducts.add(product);
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
      (l) {
        log(l.message);
      },
      (products) async {
        recentlySearchedProducts = products;
        emit(GetRecentlySearchedProductsSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
