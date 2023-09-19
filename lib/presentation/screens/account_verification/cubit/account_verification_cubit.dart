import 'dart:io';

import 'package:delalty/app/functions.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/presentation/screens/account_verification/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'account_verification_state.dart';

enum AccountVerificationSteps {
  providing,
  data,
  idImages,
  finish,
}

@injectable
class AccountVerificationCubit extends Cubit<AccountVerificationState> {
  AccountVerificationCubit() : super(AccountVerificationInitial());

  static AccountVerificationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  AccountVerificationSteps accountVerificationSteps =
      AccountVerificationSteps.providing;

  String? tripleNameError;
  String? emailError;
  String? phoneNumberError;
  String? addressError;
  String? termsAndConditionError;
  String tripleName = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String termsAndCondition = '';
  String country = 'Egypt';

  Widget getStepWidget() {
    switch (accountVerificationSteps) {
      case AccountVerificationSteps.providing:
        return const ProvideApplicationDocumentationWidget();
      case AccountVerificationSteps.data:
        return const AccountVerificationData();
      case AccountVerificationSteps.idImages:
        return const AccountVerificationIdImages();
      default:
        return Container();
    }
  }

  void changeStep(AccountVerificationSteps accountVerificationSteps) {
    emit(AccountVerificationInitial());
    this.accountVerificationSteps = accountVerificationSteps;
    emit(AccountVerificationChangeStep());
  }

  void onFullNameChange(String input) {
    emit(AccountVerificationInitial());
    if (input.isEmpty) {
      tripleNameError = AppStrings.fillField;
    } else if (input.trim().split(' ').length != 3) {
      tripleNameError = AppStrings.enterYourTripleName;
    } else {
      tripleNameError = null;
      tripleName = input;
    }
    emit(AccountVerificationFieldChanged());
  }

  void onEmailChange(String input) {
    emit(AccountVerificationInitial());
    if (input.isEmpty) {
      emailError = AppStrings.fillField;
    } else if (!isEmail(input)) {
      emailError = AppStrings.invalidEmail;
    } else {
      emailError = null;
      email = input;
    }
    emit(AccountVerificationFieldChanged());
  }

  void onPhoneNumberChange(String input) {
    emit(AccountVerificationInitial());
    if (input.isEmpty) {
      phoneNumberError = AppStrings.fillField;
    } else if (!isPhoneNumber(input)) {
      phoneNumberError = AppStrings.phoneInvalid;
    } else {
      phoneNumberError = null;
      phoneNumber = input;
    }
    emit(AccountVerificationFieldChanged());
  }

  void onAddressChange(String input) {
    emit(AccountVerificationInitial());
    if (input.isEmpty) {
      addressError = AppStrings.fillField;
    } else {
      addressError = null;
      address = input;
    }
    emit(AccountVerificationFieldChanged());
  }

  void onCountryChange(String country) {
    this.country = country;
  }

  void next() {
    if (tripleName.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        address.isEmpty) {
      onFullNameChange(tripleName);
      onEmailChange(email);
      onPhoneNumberChange(phoneNumber);
      onAddressChange(address);
    }

    if (tripleNameError == null &&
        emailError == null &&
        phoneNumberError == null &&
        addressError == null) {
      changeStep(AccountVerificationSteps.idImages);
    }
  }

  File? frontIdCardImage;
  File? backIdCardImage;

  Future<void> addIdCardImage(BuildContext context) async {
    emit(AccountVerificationInitial());
    if (frontIdCardImage == null) {
      frontIdCardImage = await getImageFile(context);
      emit(AccountVerificationAddIdCardImage());
      return;
    }
    if (backIdCardImage == null) {
      backIdCardImage = await getImageFile(context);
      emit(AccountVerificationAddIdCardImage());

      return;
    }
  }

  void checkUserData() {}

  void clearFrontIdCardImage() {
    emit(AccountVerificationInitial());
    frontIdCardImage = null;
    emit(AccountVerificationAddIdCardImage());
  }

  void clearBackIdCardImage() {
    emit(AccountVerificationInitial());

    backIdCardImage = null;
    emit(AccountVerificationAddIdCardImage());
  }

  bool isIdCardImagesDone() =>
      frontIdCardImage != null && backIdCardImage != null;
}
