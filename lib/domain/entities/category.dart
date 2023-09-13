import 'input.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final int parentId;
  final List<Input> inputs;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.inputs,
  });
}
