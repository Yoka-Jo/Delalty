part of 'requests.dart';

enum RelationShipType { BLOCK, UNBLOCK, ADD_FRIEND, REMOVE_FRIEND }

@JsonSerializable(createFactory: false)
class ChangeRelationshipTypeRequest {
  final String type;

  final int target_id;

  ChangeRelationshipTypeRequest({
    required this.type,
    required this.target_id,
  });

  Map<String, dynamic> toJson() => _$ChangeRelationshipTypeRequestToJson(this);
}
