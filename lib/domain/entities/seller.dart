import 'user.dart';

class Seller {
  final String id;
  final bool verified;
  final User? user;

  Seller({
    required this.id,
    required this.verified,
    required this.user,
  });
}
