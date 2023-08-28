import 'package:delalty/data/network/requests.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/components/utils/custom_button_animation.dart';
import '../../../../core/form_fields/email.dart';
import '../../../../core/form_fields/password.dart';
import '../../../../core/form_fields/phone.dart';
import '../../../../core/form_fields/username.dart';
import '../../../../domain/usecases/register_usecase.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._useCase) : super(const SignupState());
  static SignupCubit get(BuildContext context) => BlocProvider.of(context);
  final RegisterUseCase _useCase;

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

  Future<void> signup() async {
    final name = Username.validated(state.username.value);
    final email = Email.validated(state.email.value);
    final phone = Phone.validated(state.phone.value);
    final password = Password.validated(state.password.value);

    final isValid = Formz.validate([
      name,
      email,
      phone,
      password,
    ]);
    btnKey.currentState!.animateForward();
    if (isValid) {
      final response = await _useCase(
        RegisterRequest(
          name: name.value,
          email: email.value,
          phone: phone.value,
          password: password.value,
          passwordConfirmation: password.value,
        ),
      );

      response.fold((failure) {
        emit(state.copyWith(error: failure.message));
        btnKey.currentState!.animateReverse();
      }, (_) {
        emit(state.copyWith(isSuccess: true));
      });
    }
    btnKey.currentState!.animateReverse();
  }
}
