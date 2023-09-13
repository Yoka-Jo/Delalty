part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class AuthDataResponse extends Equatable implements DataResponse<AuthData> {
  final int? userId;
  final String? accessToken;
  final bool? isRegister;
  final bool? hasPassword;
  final String? phoneStatus;
  final bool? verifiedEmail;

  const AuthDataResponse({
    required this.userId,
    required this.accessToken,
    required this.isRegister,
    required this.hasPassword,
    required this.phoneStatus,
    required this.verifiedEmail,
  });

  @override
  AuthData toDomain() {
    return AuthData(
        userId: userId.orZero(),
        accessToken: accessToken.orEmpty(),
        isRegister: isRegister.orFalse(),
        hasPassword: hasPassword.orFalse(),
        phoneStatus: phoneStatus.orEmpty(),
        verifiedEmail: verifiedEmail.orFalse());
  }

  @override
  List<Object?> get props => [
        userId,
        accessToken,
        isRegister,
        hasPassword,
        phoneStatus,
        verifiedEmail
      ];

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthDataResponseFromJson(json);
}
