import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/components/utils/custom_button_animation.dart';
import '../../../../core/form_fields/email.dart';
import '../../../../core/form_fields/password.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
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

  Future<void> login() async {}
}
