part of '../../core/models/responses.dart';

@JsonSerializable()
class ProductResponse extends Equatable implements DataResponse<Product> {
  final String id;
  final String? title;
  final String? description;
  final dynamic price;
  @JsonKey(name: 'category_id')
  final String? categoryId;
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
    String mainImage = '';
    if (mainImageId != null && images != null) {
      if (mainImageId?.contains('http') == true) {
        mainImage = mainImageId!;
      } else {
        final ProductImageResponse image =
            images!.firstWhere((element) => element.id == mainImageId);
        mainImage =
            "${Constants.productImagePath}${image.id}.${image.extension}";
      }
    }
    return Product(
      id: id,
      title: title.orEmpty(),
      description: description.orEmpty(),
      price: price,
      categoryId: categoryId.orEmpty(),
      values: values?.map((item) => item.toDomain()).toList() ?? [],
      images: images?.map((item) => item.toDomain()).toList() ?? [],
      seller: seller?.toDomain(),
      visible: visible.orFalse(),
      mainImageId: mainImage,
    );
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

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
