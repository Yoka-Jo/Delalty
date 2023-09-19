part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class RelationShipResponse extends Equatable
    implements DataResponse<RelationShip> {
  final String? type;

  const RelationShipResponse({
    required this.type,
  });

  @override
  RelationShip toDomain() {
    return RelationShip(type: type.orEmpty());
  }

  @override
  List<Object?> get props => [type];

  factory RelationShipResponse.fromJson(Map<String, dynamic> json) =>
      _$RelationShipResponseFromJson(json);
}
