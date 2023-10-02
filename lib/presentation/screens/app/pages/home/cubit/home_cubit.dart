import 'dart:developer';

import '../../../../../../core/base_usecase.dart';
import '../../../../../../data/requests/requests.dart';
import '../../../../../../domain/usecases/get_category_usecase.dart';
import '../../../../../../domain/usecases/get_product_for_category_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../domain/usecases/get_best_categories_usecase.dart';
import '../../../../../../domain/usecases/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/category.dart';
import '../../../../../../domain/entities/product.dart';
import '../../../../../../domain/usecases/get_trending_products_usecase.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getCategoriesUseCase,
    this._getBestCategoriesUseCase,
    this._getProductForCategoryUseCase,
    this._getCategoryUseCase,
    this._getTrendingProductsUseCase,
  ) : super(HomeInitial());
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetCategoryUseCase _getCategoryUseCase;
  final GetBestCategoriesUseCase _getBestCategoriesUseCase;
  final GetProductForCategoryUseCase _getProductForCategoryUseCase;
  final GetTrendingProductsUseCase _getTrendingProductsUseCase;

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<Category>? categories;
  List<Category>? bestCategories;
  List<Product>? trendingProducts;
  Map<String, List<Product>?> productsMap = {};

  int get numberOfCategoriesToRetrieve => 5;
  int page = 1;

  void reInitializeFields() {
    emit(HomeInitial());
    categories;
    bestCategories;
    productsMap = {};
    page = 1;
    emit(HomeReInitializeFields());
  }

  Future<void> _getCategories() async {
    final response = await _getCategoriesUseCase(NoParams());
    response.fold((l) {
      emit(HomeGetCategoriesFailure(l.message));
    }, (categories) {
      this.categories = categories;
      emit(HomeGetCategoriesSuccess());
    });
  }

  Future<Category?> _getCategoryById(String id) async {
    final response = await _getCategoryUseCase(GetCategoryRequest(id: id));
    return response.fold((l) {
      emit(HomeGetCategoryByIdFailure(l.message));
      return null;
    }, (category) {
      return category;
    });
  }

  Future<void> _getBestCategories() async {
    final response = await _getBestCategoriesUseCase(NoParams());
    response.fold((l) {
      emit(HomeGetBestCategoriesFailure(l.message));
    }, (bestCategories) async {
      final List<Category> result = [];
      for (var categoryId in bestCategories) {
        final category = await _getCategoryById(categoryId);
        if (category != null) {
          result.add(category);
        }
      }

      this.bestCategories = result;
      // await Future.wait(bestCategories.map((id) async {}));

      emit(HomeGetBestCategoriesSuccess());
    });
  }

  Future<void> _getTrendingProducts() async {
    final response = await _getTrendingProductsUseCase(NoParams());
    response.fold((l) {
      emit(HomeGetTrendingProductsFailure(l.message));
    }, (trendingProducts) async {
      this.trendingProducts = trendingProducts;
      emit(HomeGetTrendingProductsSuccess());
    });
  }

  bool isGettingCategoriesProducts = false;

  Future<void> getCategoriesProducts() async {
    if (categories == null ||
        isGettingCategoriesProducts ||
        numberOfCategoriesToRetrieve * (page - 1) >= categories!.length) {
      return;
    }
    isGettingCategoriesProducts = true;
    emit(HomeGetProductsForCategoriesLoading());
    int retrievalLength = (numberOfCategoriesToRetrieve * page);
    for (int i = numberOfCategoriesToRetrieve * (page - 1);
        i <
            (categories!.length < retrievalLength
                ? categories!.length
                : retrievalLength);
        i++) {
      emit(HomeInitial());
      final response = await _getProductForCategoryUseCase(
        GetProductsForCategoryRequest(
          categoryId: categories![i].id,
        ),
      );
      response.fold((l) {
        emit(HomeGetProductsForCategoriesFailure(l.message));
      }, (data) {
        if (data.total != 0) {
          log(data.products[0].title);
          productsMap[categories![i].id] = data.products;
        }
        emit(HomeGetProductsForCategoriesSuccess());
      });
    }
    isGettingCategoriesProducts = false;

    page++;
  }

  Future<void> getHomeData() async {
    if (categories != null &&
        bestCategories != null &&
        productsMap.isNotEmpty) {
      return;
    }
    await Future.wait(
      [
        _getCategories(),
        _getBestCategories(),
        _getTrendingProducts(),
      ],
    );

    await getCategoriesProducts();
  }
}
