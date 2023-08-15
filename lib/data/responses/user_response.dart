part of 'responses.dart';

@JsonSerializable(createToJson: false)
class UserResponse extends Equatable implements DataResponse<User> {
  final String? email;
  const UserResponse({
    this.email,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  @override
  User toDomain() {
    return User(email: email.orEmpty());
  }

  @override
  List<Object?> get props => [email];
}
