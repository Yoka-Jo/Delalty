import 'user_image.dart';

class User {
  final int id;
  final String name;
  final UserImage? image;
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
