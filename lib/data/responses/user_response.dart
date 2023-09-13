part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class UserResponse extends Equatable implements DataResponse<User> {
  final int? id;
  final String? name;
  final UserImageResponse? image;
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @JsonKey(name: 'is_company')
  final bool? isCompany;

  const UserResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.isAdmin,
    required this.isCompany,
  });

  @override
  User toDomain() {
    return User(
        id: id.orZero(),
        name: name.orEmpty(),
        image: image?.toDomain(),
        isAdmin: isAdmin.orFalse(),
        isCompany: isCompany.orFalse());
  }

  @override
  List<Object?> get props => [id, name, image, isAdmin, isCompany];

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
