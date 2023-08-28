class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final bool emailVerified;
  final bool phoneVerified;
  final String image;
  final bool isAdmin;
  final String updatedAt;
  final String createdAt;
  final int expiredToken;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerified,
    required this.phoneVerified,
    required this.image,
    required this.isAdmin,
    required this.updatedAt,
    required this.createdAt,
    required this.expiredToken,
    required this.token,
  });
}
