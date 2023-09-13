// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class InputResponse extends Equatable implements DataResponse<Input> {
  final String id;
  final String? name;
  final String? type;
  final Map<String, dynamic>? validations;
  @JsonKey(name: 'required')
  final bool isRequired;

  const InputResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.validations,
    required this.isRequired,
  });
  @override
  Input toDomain() {
    return Input(
      id: id,
      name: name.orEmpty(),
      type: type.orEmpty(),
      validations: validations ?? {},
      isRequired: isRequired.orFalse(),
    );
  }

  @override
  List<Object?> get props => [name, type, validations];

  factory InputResponse.fromJson(Map<String, dynamic> json) =>
      _$InputResponseFromJson(json);
}
