part of 'requests.dart';

@JsonSerializable(createFactory: false)
class CreateProductRequest {
  final String title;
  final String description;
  final double price;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'main_image_index')
  final int mainImageIndex;

  final String file;

  CreateProductRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.mainImageIndex,
    required this.file,
  });

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
