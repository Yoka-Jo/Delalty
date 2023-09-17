import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/add_product_to_favorites_usecase.dart';
import 'package:delalty/domain/usecases/remove_product_from_favorites_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delalty/core/base_usecase.dart';
import 'package:delalty/domain/usecases/get_favorites_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/search_items.dart';
import '../../../../domain/entities/product.dart';

part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._getFavoritesUseCase, this._addProductToFavoritesUseCase,
      this._removeProductFromFavoritesUseCase)
      : super(FavoriteInitial());
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddProductToFavoritesUseCase _addProductToFavoritesUseCase;
  final RemoveProductFromFavoritesUseCase _removeProductFromFavoritesUseCase;
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  List<Product> products = [];
  List<Product> searchedProducts = [];

  Future<void> getFavorites() async {
    emit(const GetFavoritesLoading());
    final response = await _getFavoritesUseCase(NoParams());
    response.fold(
      (l) => emit(GetFavoritesFailure(l.message)),
      (products) {
        this.products = products;
        emit(const GetFavoritesSuccess());
      },
    );
  }

  Future<void> searchedFavorites(String searchWord) async {
    emit(FavoriteInitial());
    if (searchWord.isEmpty) {
      return;
    }
    final search = SearchItems<Product>.find(
      products,
      (item) =>
          item.title.toLowerCase().contains(searchWord.trim().toLowerCase()),
    );
    searchedProducts = search.result;
    emit(const GetSearchedFavoritesSuccess());
  }

  Future<void> _addProductToFavorite(Product product) async {
    emit(const AddProductToFavoriteLoading());
    products.add(product);
    final response = await _addProductToFavoritesUseCase(
      AddProductToFavoritesRequest(
        productId: product.id,
      ),
    );
    response.fold((l) {
      products.removeWhere((element) => element.id == product.id);
      emit(AddProductToFavoriteFailure(l.message));
    }, (_) {
      emit(const AddProductToFavoriteSuccess());
    });
  }

  Future<void> _removeProductFromFavorites(Product product) async {
    emit(const RemoveProductFromFavoriteLoading());
    products.removeWhere((element) => element.id == product.id);
    final response = await _removeProductFromFavoritesUseCase(
      RemoveProductFromFavoritesRequest(
        productId: product.id,
      ),
    );
    response.fold((l) {
      products.add(product);
      emit(RemoveProductFromFavoriteFailure(l.message));
    }, (_) {
      emit(const RemoveProductFromFavoriteSuccess());
    });
  }

  Future<void> toggleFavorite(Product product) async {
    if (state is AddProductToFavoriteLoading ||
        state is RemoveProductFromFavoriteLoading) {
      return;
    }
    if (!isFavorite(product)) {
      await _addProductToFavorite(product);
    } else {
      await _removeProductFromFavorites(product);
    }
  }

  bool isFavorite(Product product) =>
      products.where((element) => element.id == product.id).isNotEmpty;
}
