part of 'account_verification_cubit.dart';

sealed class AccountVerificationState extends Equatable {
  const AccountVerificationState();

  @override
  List<Object> get props => [];
}

final class AccountVerificationInitial extends AccountVerificationState {}

final class AccountVerificationChangeStep extends AccountVerificationState {}

final class AccountVerificationFieldChanged extends AccountVerificationState {}

final class AccountVerificationAddIdCardImage
    extends AccountVerificationState {}

final class AccountVerificationRemoveIdCardImage
    extends AccountVerificationState {}
