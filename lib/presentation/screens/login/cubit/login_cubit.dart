import 'package:delalty/app/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/components/utils/custom_button_animation.dart';
import '../../../../core/form_fields/email.dart';
import '../../../../core/form_fields/password.dart';
import '../../../../data/requests/requests.dart';
import '../../../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase) : super(const LoginState());
  final LoginUseCase _useCase;

  void initializeEmailAndPassword(String? email, String? password) {
    if (email != null && password != null) {
      emit(
        state.copyWith(
          email: Email.validated(email),
          password: Password.validated(password),
        ),
      );
    }
  }

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  String? emailError;

  String? passwordError;

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

  Future<void> login() async {
    final email = Email.validated(state.email.value);
    final password = Password.validated(state.password.value);
    final isValid = Formz.validate([
      email,
      password,
    ]);
    emailError = email.error?.value.tr();
    passwordError = password.error?.value.tr();
    emit(
      state.copyWith(
        email: email,
        password: password,
      ),
    );
    btnKey.currentState!.animateForward();
    if (isValid) {
      final response = await _useCase(LoginRequest(
        email: email.value,
        password: password.value,
      ));

      response.fold(
        (failure) {
          final errors = failure.getErrors();
          emit(state.copyWith(error: errors));
          btnKey.currentState!.animateReverse();
        },
        (user) {
          emit(state.copyWith(isSuccess: true));
        },
      );
    }
    btnKey.currentState!.animateReverse();
  }
}
