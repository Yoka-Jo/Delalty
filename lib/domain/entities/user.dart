import 'user_image.dart';

class User {
  final String id;
  final String name;
  final String? image;
  final bool isAdmin;
  final bool isCompany;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.isAdmin,
    required this.isCompany,
  });
}
