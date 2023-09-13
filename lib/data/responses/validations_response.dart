part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ValidationsResponse extends Equatable
    implements DataResponse<Validations> {
  final int? min;
  final int? max;

  const ValidationsResponse({
    required this.min,
    required this.max,
  });

  @override
  Validations toDomain() {
    return Validations(min: min.orZero(), max: max.orZero());
  }

  @override
  List<Object?> get props => [min, max];

  factory ValidationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationsResponseFromJson(json);
}
