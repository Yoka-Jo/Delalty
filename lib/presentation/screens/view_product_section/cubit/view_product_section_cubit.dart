import 'package:delalty/data/requests/requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_product_for_category_usecase.dart';

part 'view_product_section_state.dart';

@injectable
class ViewProductSectionCubit extends Cubit<ViewProductSectionState> {
  ViewProductSectionCubit(this._useCase) : super(ViewProductSectionInitial());
  final GetProductForCategoryUseCase _useCase;

  static ViewProductSectionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final List<Product> _products = [];
  bool isGettingProdutsForFirstTime = true;
  int total = 0;
  int page = 0;

  String _categoryId = '';

  Future<void> getProducts({String? categoryId, bool next = false}) async {
    // if (!hasNext() && categoryId == null) return;
    emit(ViewProductSectionGetProductsLoading());
    categoryId ??= _categoryId;
    _categoryId = categoryId;
    if (next) {
      page++;
    }
    final response = await _useCase(
      GetProductsForCategoryRequest(
        categoryId: categoryId,
        query: {'page': page},
      ),
    );
    response.fold(
      (l) => emit(ViewProductSectionGetProductsFailure(l.message)),
      (categoryProducts) {
        _products.addAll(categoryProducts.products);
        total = categoryProducts.total;
        isGettingProdutsForFirstTime = false;
        emit(ViewProductSectionGetProductsSuccess());
      },
    );
  }

  List<Product>? _searchedProducts;
  void searchForProducts(String str) {
    emit(ViewProductSectionInitial());
    if (str.trim().isEmpty) {
      _searchedProducts = null;
    } else {
      _searchedProducts = _products
          .where((element) => element.title.trim().toLowerCase().contains(str))
          .toList();
    }
    emit(ViewProductSectionSearchForProductsSuccess());
  }

  void arrangeProducts(bool byHigher) {
    emit(ViewProductSectionInitial());
    if (byHigher) {
      (_searchedProducts ?? _products).sort(
        (a, b) => b.price - a.price,
      );
    } else {
      (_searchedProducts ?? _products).sort(
        (a, b) => a.price - b.price,
      );
    }
    print(_searchedProducts);

    emit(ViewProductSectionReArrangeProducts());
  }

  bool hasNext() => _products.length < total;

  List<Product> get products =>
      _searchedProducts == null ? _products : _searchedProducts!;
}
