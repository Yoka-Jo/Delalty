part of 'requests.dart';

@JsonSerializable(createFactory: false)
class ChangeRelationshipTypeRequest {
  final String type;

  final String target_id;

  ChangeRelationshipTypeRequest({
    required this.type,
    required this.target_id,
  });

  Map<String, dynamic> toJson() => _$ChangeRelationshipTypeRequestToJson(this);
}
