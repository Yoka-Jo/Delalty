import 'product_image.dart';
import 'value.dart';
import 'seller.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final int categoryId;
  final List<Value> values;
  final List<ProductImage> images;
  final Seller? seller;
  final bool visible;
  final String mainImageId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.values,
    required this.images,
    required this.seller,
    required this.visible,
    required this.mainImageId,
  });
}
