part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchChangeSearchString extends SearchState {}

final class UserIsSearching extends SearchState {}

final class SearchForProductsLoading extends SearchState {}

final class SearchForProductsSuccess extends SearchState {}

final class SearchForProductsFailure extends SearchState {
  final String message;

  const SearchForProductsFailure(this.message);
}

final class AddProductToRecentlySearchedLoading extends SearchState {}

final class AddProductToRecentlySearchedSuccess extends SearchState {}

final class AddProductToRecentlySearchedFailure extends SearchState {
  final String message;

  const AddProductToRecentlySearchedFailure(this.message);
}

final class GetRecentlySearchedProductsLoading extends SearchState {}

final class GetRecentlySearchedProductsSuccess extends SearchState {}

final class GetRecentlySearchedProductsFailure extends SearchState {
  final String message;

  const GetRecentlySearchedProductsFailure(this.message);
}
