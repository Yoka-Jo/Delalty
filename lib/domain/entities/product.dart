import 'product_image.dart';
import 'seller.dart';
import 'value.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final dynamic price;
  final String categoryId;
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

  Product copyWith({
    String? id,
    String? title,
    String? description,
    dynamic price,
    String? categoryId,
    List<Value>? values,
    List<ProductImage>? images,
    Seller? seller,
    bool? visible,
    String? mainImageId,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      values: values ?? this.values,
      images: images ?? this.images,
      seller: seller ?? this.seller,
      visible: visible ?? this.visible,
      mainImageId: mainImageId ?? this.mainImageId,
    );
  }
}
