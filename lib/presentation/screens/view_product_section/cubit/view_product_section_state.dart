part of 'view_product_section_cubit.dart';

sealed class ViewProductSectionState extends Equatable {
  const ViewProductSectionState();

  @override
  List<Object> get props => [];
}

final class ViewProductSectionInitial extends ViewProductSectionState {}

final class ViewProductSectionGetProductsLoading
    extends ViewProductSectionState {}

final class ViewProductSectionGetProductsSuccess
    extends ViewProductSectionState {}

final class ViewProductSectionGetProductsFailure
    extends ViewProductSectionState {
  final String message;

  const ViewProductSectionGetProductsFailure(this.message);
}

final class ViewProductSectionSearchForProductsSuccess
    extends ViewProductSectionState {}
