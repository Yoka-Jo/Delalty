part of 'add_your_product_cubit.dart';

sealed class AddYourProductState extends Equatable {
  const AddYourProductState();

  @override
  List<Object> get props => [];
}

final class AddYourProductInitial extends AddYourProductState {}

final class ChangeCheckBoxValue extends AddYourProductState {}

final class UnFinishedAddingProductDetails extends AddYourProductState {}

final class CreateProductLoading extends AddYourProductState {}

final class CreateProductSuccess extends AddYourProductState {
  final Product product;

  const CreateProductSuccess(this.product);
}

final class CreateProductFailure extends AddYourProductState {
  final String message;

  const CreateProductFailure(this.message);
}

final class PickedImagesMoreThanAllowedError extends AddYourProductState {}

final class SelectedImagesChange extends AddYourProductState {}

final class RemoveImageFromSelected extends AddYourProductState {}

final class FinishedAddingProductDetails extends AddYourProductState {}
