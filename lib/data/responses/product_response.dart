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
        final result = images!.where((element) => element.id == mainImageId);
        if (result.isNotEmpty) {
          final ProductImageResponse image = result.elementAt(0);
          mainImage =
              "${Constants.productImagePath}${image.id}.${image.extension}";
        }
      }
    }
    if (mainImage.isEmpty && images != null) {
      mainImage = images!.isNotEmpty
          ? "${Constants.productImagePath}${images![0].id}.${images![0].extension}"
          : '';
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
      mainImage: mainImage,
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
