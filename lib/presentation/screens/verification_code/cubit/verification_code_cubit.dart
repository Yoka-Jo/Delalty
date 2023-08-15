import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part 'verification_code_state.dart';

@injectable
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(VerificationCodeInitial()) {
    _startTimer();
  }
  static VerificationCodeCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final Duration _duration = const Duration(minutes: 5);
  late Timer timer;
  late Duration otpDuration = _duration;
  final StreamController<ErrorAnimationType> errorAnimationController =
      StreamController();

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

  Future<void> onVerify(String code) async {}

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
