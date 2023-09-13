class AuthData {
  final String userId;
  final String accessToken;
  final bool isRegister;
  final bool hasPassword;
  final String phoneStatus;
  final bool verifiedEmail;

  AuthData({
    required this.userId,
    required this.accessToken,
    required this.isRegister,
    required this.hasPassword,
    required this.phoneStatus,
    required this.verifiedEmail,
  });
}
