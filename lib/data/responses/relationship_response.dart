// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable()
class RelationShipResponse extends Equatable
    implements DataResponse<RelationShip> {
  final String? type;
  final bool? verified;
  final RelationShipTargetResponse? target;

  const RelationShipResponse({
    this.type,
    required this.verified,
    required this.target,
  });

  @override
  RelationShip toDomain() {
    return RelationShip(
      type: type.orEmpty(),
      verified: verified.orFalse(),
      user: target?.toDomain(),
    );
  }

  factory RelationShipResponse.fromJson(Map<String, dynamic> json) =>
      _$RelationShipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RelationShipResponseToJson(this);

  @override
  List<Object?> get props => [type, verified, target];
}
