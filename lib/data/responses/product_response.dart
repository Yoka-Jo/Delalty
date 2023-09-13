part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ProductResponse extends Equatable implements DataResponse<Product> {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final List<ValueResponse>? values;
  @JsonKey(name: 'images')
  final List<ProductImageResponse>? images;
  final SellerResponse? seller;
  final bool? visible;
  @JsonKey(name: 'main_image_id')
  final String? mainImageId;

  const ProductResponse({
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

  @override
  Product toDomain() {
    return Product(
        id: id.orZero(),
        title: title.orEmpty(),
        description: description.orEmpty(),
        price: price.orZero(),
        categoryId: categoryId.orZero(),
        values: values?.map((item) => item.toDomain()).toList() ?? [],
        images: images?.map((item) => item.toDomain()).toList() ?? [],
        seller: seller?.toDomain(),
        visible: visible.orFalse(),
        mainImageId: mainImageId.orEmpty());
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        categoryId,
        values,
        images,
        seller,
        visible,
        mainImageId
      ];

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
