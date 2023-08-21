part of 'property_filter_cubit.dart';

sealed class PropertyFilterState extends Equatable {
  const PropertyFilterState();

  @override
  List<Object> get props => [];
}

final class PropertyFilterInitial extends PropertyFilterState {}

final class PropertyFilterChangeTypeOfProperty extends PropertyFilterState {}

final class PropertyFilterChangeSaleOption extends PropertyFilterState {}

final class PropertyFilterChangeType extends PropertyFilterState {}

final class PropertyFilterChangeMethodOfPayment extends PropertyFilterState {}

final class PropertyFilterChangeFinishingType extends PropertyFilterState {}

final class PropertyFilterChangeMinPrice extends PropertyFilterState {}

final class PropertyFilterChangeMaxPrice extends PropertyFilterState {}
