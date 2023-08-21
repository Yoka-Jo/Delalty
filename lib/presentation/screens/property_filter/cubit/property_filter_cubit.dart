import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/strings_manager.dart';
import '../models/propery_type_model.dart';

part 'property_filter_state.dart';

@injectable
class PropertyFilterCubit extends Cubit<PropertyFilterState> {
  PropertyFilterCubit() : super(PropertyFilterInitial());
  static PropertyFilterCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();

  List<PropertyTypeModel> typesOfProperty = [
    const PropertyTypeModel(
      title: AppStrings.home,
      image: ImageAssets.homeProperty,
    ),
    const PropertyTypeModel(
      title: AppStrings.apartment,
      image: ImageAssets.appartmentProperty,
    ),
    const PropertyTypeModel(
      title: AppStrings.villa,
      image: ImageAssets.villaProperty,
    ),
  ];
  List<String> types = [
    AppStrings.all,
    AppStrings.apartments,
    AppStrings.furnishedApartments,
    AppStrings.villa,
    AppStrings.land,
    AppStrings.buildings,
    AppStrings.administrative,
    AppStrings.business,
    AppStrings.medical,
  ];

  List<String> methodOfPayments = [
    AppStrings.all,
    AppStrings.inCash,
    AppStrings.installment,
  ];
  List<String> finishingTypes = [
    AppStrings.all,
    AppStrings.extraSuperLux,
    AppStrings.superLux,
    AppStrings.lukas,
    AppStrings.semiFinishing,
    AppStrings.noFinishing,
  ];

  String typeOfProperty = AppStrings.home;
  String type = AppStrings.all;
  String methodOfPayment = AppStrings.all;
  String finishingType = AppStrings.all;
  String saleOption = AppStrings.forSale;
  RangeValues currentRangeValues = const RangeValues(0, 0);

  void changeSaleOption(String saleOption) {
    emit(PropertyFilterInitial());
    this.saleOption = saleOption;
    emit(PropertyFilterChangeSaleOption());
  }

  void changeTypeOfProperty(String typeOfProperty) {
    emit(PropertyFilterInitial());
    this.typeOfProperty = typeOfProperty;
    emit(PropertyFilterChangeTypeOfProperty());
  }

  void changeType(String type) {
    emit(PropertyFilterInitial());
    this.type = type;
    emit(PropertyFilterChangeType());
  }

  void changeMethodOfPayment(String methodOfPayment) {
    emit(PropertyFilterInitial());
    this.methodOfPayment = methodOfPayment;
    emit(PropertyFilterChangeMethodOfPayment());
  }

  void changeFinishingType(String finishingType) {
    emit(PropertyFilterInitial());
    this.finishingType = finishingType;
    emit(PropertyFilterChangeFinishingType());
  }

  void changeMinPrice(String min) {
    emit(PropertyFilterInitial());

    currentRangeValues = RangeValues(double.parse(min), currentRangeValues.end);
    minPriceController.text = min;
    emit(PropertyFilterChangeMinPrice());
  }

  void changeMaxPrice(String max) {
    emit(PropertyFilterInitial());

    currentRangeValues =
        RangeValues(currentRangeValues.start, double.parse(max));

    maxPriceController.text = max;
    emit(PropertyFilterChangeMaxPrice());
  }

  @override
  Future<void> close() {
    minPriceController.dispose();
    maxPriceController.dispose();
    return super.close();
  }
}
