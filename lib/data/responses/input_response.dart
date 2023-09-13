part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class InputResponse extends Equatable implements DataResponse<Input> {
  final String? name;
  final String? type;
  final List<ValidationsResponse>? validations;

  const InputResponse({
    required this.name,
    required this.type,
    required this.validations,
  });

  @override
  Input toDomain() {
    return Input(
        name: name.orEmpty(),
        type: type.orEmpty(),
        validations:
            validations?.map((item) => item.toDomain()).toList() ?? []);
  }

  @override
  List<Object?> get props => [name, type, validations];

  factory InputResponse.fromJson(Map<String, dynamic> json) =>
      _$InputResponseFromJson(json);
}
