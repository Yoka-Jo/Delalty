// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/domain/entities/product.dart';

class CategoryProducts {
  final List<Product> products;
  final int total;
  CategoryProducts({
    required this.products,
    required this.total,
  });
}
