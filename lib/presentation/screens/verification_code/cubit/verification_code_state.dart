part of 'verification_code_cubit.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

final class VerificationCodeInitial extends VerificationCodeState {}

final class VerificationCodeInvalid extends VerificationCodeState {}

final class VerificationCodeChangeOtpDuration extends VerificationCodeState {}

final class VerificationCodeLoading extends VerificationCodeState {}

final class VerificationCodeSuccess extends VerificationCodeState {}

final class VerificationCodeFailure extends VerificationCodeState {
  final String message;

  const VerificationCodeFailure(this.message);
}
