part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class GetProductLoading extends ProductState {}

final class GetProductSuccess extends ProductState {}

final class GetProductFailure extends ProductState {
  final String message;
  const GetProductFailure(this.message);
}

final class GetProductCommentsLoading extends ProductState {}

final class GetProductCommentsSuccess extends ProductState {}

final class GetProductCommentsFailure extends ProductState {
  final String message;
  const GetProductCommentsFailure(this.message);
}
