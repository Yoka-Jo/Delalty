import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/components/utils/custom_button_animation.dart';
import '../../../../core/form_fields/email.dart';
import '../../../../core/form_fields/password.dart';
import '../../../../core/form_fields/phone.dart';
import '../../../../core/form_fields/username.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());
  static SignupCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  String? emailError;
  String? usernameError;
  String? phoneError;
  String? passwordError;

  void togglePasswordShown() {
    emit(state.copyWith(isPasswordShown: !state.isPasswordShown));
  }

  void onEmailChanged(String newValue) {
    final shouldValidate = state.email.isNotValid;
    final newEmailState = shouldValidate
        ? Email.validated(newValue)
        : Email.unvalidated(newValue);
    final newState = state.copyWith(
      email: newEmailState,
    );
    emailError = newState.email.error?.value.tr();
    emit(newState);
  }

  void onUsernameChanged(String newValue) {
    final shouldValidate = state.username.isNotValid;
    final newUsernameState = shouldValidate
        ? Username.validated(newValue)
        : Username.unvalidated(newValue);
    final newState = state.copyWith(
      username: newUsernameState,
    );
    usernameError = newState.username.error?.value.tr();
    emit(newState);
  }

  void onPhoneChanged(String newValue) {
    final shouldValidate = state.phone.isNotValid;
    final newPhoneState = shouldValidate
        ? Phone.validated(newValue)
        : Phone.unvalidated(newValue);
    final newState = state.copyWith(
      phone: newPhoneState,
    );
    phoneError = newState.phone.error?.value.tr();
    emit(newState);
  }

  void onPasswordChanged(String newValue) {
    final shouldValidate = state.password.isNotValid;
    final newPasswordState = shouldValidate
        ? Password.validated(newValue)
        : Password.unvalidated(newValue);
    final newState = state.copyWith(
      password: newPasswordState,
    );
    passwordError = newState.password.error?.value.tr();
    emit(newState);
  }

  Future<void> signup() async {}
}
