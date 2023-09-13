part of 'requests.dart';

@JsonSerializable(createFactory: false)
class RegisterRequest {
  final String email;
  final String password;
  final String name;
  final String phone;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
