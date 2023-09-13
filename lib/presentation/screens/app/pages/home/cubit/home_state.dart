part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeGetCategoriesSuccess extends HomeState {}

final class HomeGetCategoriesFailure extends HomeState {
  final String message;

  const HomeGetCategoriesFailure(this.message);
}

final class HomeGetBestCategoriesSuccess extends HomeState {}

final class HomeGetBestCategoriesFailure extends HomeState {
  final String message;

  const HomeGetBestCategoriesFailure(this.message);
}

final class HomeGetCategoryByIdFailure extends HomeState {
  final String message;

  const HomeGetCategoryByIdFailure(this.message);
}
