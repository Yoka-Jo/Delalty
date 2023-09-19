import 'relationship_target.dart';

class RelationShip {
  final String type;
  final bool verified;
  final RelationShipTarget? user;

  const RelationShip({
    required this.type,
    required this.verified,
    required this.user,
  });
}
