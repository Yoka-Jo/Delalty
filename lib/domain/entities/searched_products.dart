// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/domain/entities/product.dart';

class SearchedProducts {
  final List<Product> products;
  final int total;
  SearchedProducts({
    required this.products,
    required this.total,
  });
}
