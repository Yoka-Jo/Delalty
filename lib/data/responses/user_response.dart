part of 'responses.dart';

@JsonSerializable(createToJson: false)
class UserResponse extends Equatable implements DataResponse<User> {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  @JsonKey(name: 'email_verified')
  final bool? emailVerified;
  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;
  final String? image;
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'expired_token')
  final int? expiredToken;
  final String? token;

  const UserResponse({
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

  @override
  User toDomain() {
    return User(
        id: id.orZero(),
        name: name.orEmpty(),
        email: email.orEmpty(),
        phone: phone.orEmpty(),
        emailVerified: emailVerified.orFalse(),
        phoneVerified: phoneVerified.orFalse(),
        image: image.orEmpty(),
        isAdmin: isAdmin.orFalse(),
        updatedAt: updatedAt.orEmpty(),
        createdAt: createdAt.orEmpty(),
        expiredToken: expiredToken.orZero(),
        token: token.orEmpty());
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        emailVerified,
        phoneVerified,
        image,
        isAdmin,
        updatedAt,
        createdAt,
        expiredToken,
        token
      ];

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
