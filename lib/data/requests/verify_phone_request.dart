part of 'requests.dart';

@JsonSerializable(createFactory: false)
class VerifyPhoneRequest {
  final String phone;
  final int code;

  VerifyPhoneRequest({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => _$VerifyPhoneRequestToJson(this);
}
