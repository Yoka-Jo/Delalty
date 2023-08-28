// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final Email email;
  final Username username;
  final Phone phone;
  final Password password;
  final String? error;
  final bool isPasswordShown;
  final bool isSuccess;
  const SignupState({
    this.email = const Email.unvalidated(),
    this.username = const Username.unvalidated(),
    this.phone = const Phone.unvalidated(),
    this.password = const Password.unvalidated(),
    this.error,
    this.isPasswordShown = false,
    this.isSuccess = false,
  });

  SignupState copyWith({
    Email? email,
    Username? username,
    Phone? phone,
    Password? password,
    String? error,
    bool? isPasswordShown,
    bool? isSuccess,
  }) {
    return SignupState(
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isPasswordShown: isPasswordShown ?? this.isPasswordShown,
      error: error,
      isSuccess: isSuccess ?? false,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      username,
      phone,
      password,
      isPasswordShown,
      error,
      isSuccess,
    ];
  }
}
