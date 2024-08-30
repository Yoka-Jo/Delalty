import 'dart:async';

import '../../../../data/requests/requests.dart';
import '../../../../domain/usecases/verify_phone_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../app/cubit/app_cubit.dart';

part 'verification_code_state.dart';

@injectable
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit(this._useCase) : super(VerificationCodeInitial()) {
    _startTimer();
  }
  final VerifyPhoneUseCase _useCase;

  static VerificationCodeCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final Duration _duration = const Duration(minutes: 5);
  late Timer timer;
  late Duration otpDuration = _duration;
  final StreamController<ErrorAnimationType> errorAnimationController =
      StreamController.broadcast();

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => _addTime());
  }

  Future<void> _addTime() async {
    emit(VerificationCodeInitial());
    final seconds = otpDuration.inSeconds - 1;
    if (seconds < 0) {
      timer.cancel();
      emit(VerificationCodeInvalid());
    } else {
      otpDuration = Duration(seconds: seconds);
      emit(VerificationCodeChangeOtpDuration());
    }
  }

  Future<void> reRunTimer() async {
    timer.cancel();
    otpDuration = _duration;
    _startTimer();
  }

  Future<void> onVerify(String code, BuildContext context) async {
    if (!validateInput(code)) {
      return;
    }
    emit(VerificationCodeLoading());
    await AppCubit.get(context).getUserData();
    final response =
        await _useCase(VerifyPhoneRequest(phone: '', code: int.parse(code)));
    response.fold(
      (l) {
        errorAnimationController.add(ErrorAnimationType.shake);
        emit(VerificationCodeFailure(l.message));
      },
      (authData) => emit(VerificationCodeSuccess()),
    );
  }

  bool validateInput(String value) {
    if (value.isNotEmpty && int.tryParse(value) == null) {
      errorAnimationController.add(ErrorAnimationType.shake);
      return false;
    } else {
      errorAnimationController.add(ErrorAnimationType.clear);
      return true;
    }
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
