import 'input.dart';

class Category {
  final String id;
  final String name;
  final String image;
  final String parentId;
  final List<Input> inputs;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.inputs,
  });
}
