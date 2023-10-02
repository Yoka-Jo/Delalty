import 'dart:developer';
import 'dart:io';

import 'package:delalty/data/requests/requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/create_product_usecase.dart';

part 'add_your_product_state.dart';

@injectable
class AddYourProductCubit extends Cubit<AddYourProductState> {
  AddYourProductCubit(this._useCase) : super(AddYourProductInitial());
  final CreateProductUseCase _useCase;

  static AddYourProductCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  double _price = 0;
  int _categoryId = 0;
  String get title => _title;
  String get descritption => _description;
  String get price => _price.toString();

  final List<ValueRequest> _values = [];

  bool finishedAddingProductDetails = false;

  void unFinishedAddingProductDetails() {
    emit(AddYourProductInitial());

    finishedAddingProductDetails = false;
    emit(UnFinishedAddingProductDetails());
  }

  void setTitle(String title) => _title = title;
  void setDescription(String description) => _description = description;
  void setPrice(String price) => _price = double.parse(price);
  void addValue(ValueRequest value) {
    if (_values.where((element) => element.inputId == value.inputId).isEmpty) {
      _values.add(value);
    }
  }

  void changeCheckBoxValue(String id, bool value) {
    emit(AddYourProductInitial());

    for (var element in _values) {
      if (element.inputId == id) {
        _values.removeWhere((element) => element.inputId == id);
        _values.add(ValueRequest(inputId: id, value: value.toString()));
      }
    }

    emit(ChangeCheckBoxValue());
  }

  bool getCheckBoxValue(String id) {
    return _values.firstWhere((element) => element.inputId == id).value ==
        'true';
  }

  String getFromFieldValue(String id) =>
      _values
          .where((element) => element.inputId == id)
          .firstOrNull
          ?.value
          .toString() ??
      '';

  final ImagePicker picker = ImagePicker();
  List<File> images = [];
  Future<void> pickImages(BuildContext context) async {
    emit(AddYourProductInitial());
    images = (await picker.pickMultiImage()).map((e) => File(e.path)).toList();
    if (images.isEmpty) {
      return;
    }
    if (images.length > 15) {
      images = [];
      emit(PickedImagesMoreThanAllowedError());
      return;
    }
    emit(SelectedImagesChange());
  }

  int imageIndex = 0;

  void removeImage() {
    emit(AddYourProductInitial());

    images.removeAt(images.length == 1 ? 0 : imageIndex);
    emit(RemoveImageFromSelected());
  }

  void changeSwipedImageIndex(int index) {
    imageIndex = index;
  }

  void next(String categoryId) {
    emit(AddYourProductInitial());

    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      _categoryId = int.parse(categoryId);
      finishedAddingProductDetails = true;
      emit(FinishedAddingProductDetails());
    }
  }

  Future<void> createProduct() async {
    emit(CreateProductLoading());
    log(_values.length.toString());

    final response = await _useCase(
      CreateProductRequest(
        title: _title,
        description: _description,
        price: _price,
        categoryId: _categoryId,
        mainImageIndex: 0,
        images: images,
        values: _values,
      ),
    );

    response.fold(
      (l) => emit(CreateProductFailure(l.message)),
      (product) => emit(CreateProductSuccess(product)),
    );
  }
}
