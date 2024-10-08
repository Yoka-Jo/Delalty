part of '../../core/models/responses.dart';

@JsonSerializable()
class ValueResponse extends Equatable implements DataResponse<Value> {
  @JsonKey(name: 'input_id')
  final String? inputId;
  final dynamic value;

  const ValueResponse({
    required this.inputId,
    required this.value,
  });

  @override
  Value toDomain() {
    return Value(inputId: inputId.orEmpty(), value: value);
  }

  @override
  List<Object?> get props => [inputId, value];

  factory ValueResponse.fromJson(Map<String, dynamic> json) =>
      _$ValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValueResponseToJson(this);
}
