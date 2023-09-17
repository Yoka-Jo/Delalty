part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoritesLoading extends FavoriteState {
  const GetFavoritesLoading();
}

final class GetFavoritesSuccess extends FavoriteState {
  const GetFavoritesSuccess();
}

final class GetFavoritesFailure extends FavoriteState {
  final String message;

  const GetFavoritesFailure(this.message);
}

final class GetSearchedFavoritesSuccess extends FavoriteState {
  const GetSearchedFavoritesSuccess();
}

final class AddProductToFavoriteLoading extends FavoriteState {
  const AddProductToFavoriteLoading();
}

final class AddProductToFavoriteSuccess extends FavoriteState {
  const AddProductToFavoriteSuccess();
}

final class AddProductToFavoriteFailure extends FavoriteState {
  final String message;

  const AddProductToFavoriteFailure(this.message);
}

final class RemoveProductFromFavoriteLoading extends FavoriteState {
  const RemoveProductFromFavoriteLoading();
}

final class RemoveProductFromFavoriteSuccess extends FavoriteState {
  const RemoveProductFromFavoriteSuccess();
}

final class RemoveProductFromFavoriteFailure extends FavoriteState {
  final String message;

  const RemoveProductFromFavoriteFailure(this.message);
}
