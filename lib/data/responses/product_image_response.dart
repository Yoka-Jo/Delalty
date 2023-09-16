part of '../../core/models/responses.dart';

@JsonSerializable()
class ProductImageResponse extends Equatable
    implements DataResponse<ProductImage> {
  final String? id;
  final String? extension;
  final String? url;

  const ProductImageResponse({
    required this.id,
    required this.extension,
    required this.url,
  });

  @override
  ProductImage toDomain() {
    return ProductImage(
      id: id.orEmpty(),
      extension: extension.orEmpty(),
      url: url != null ? "${Constants.productImagePath}$url" : '',
    );
  }

  @override
  List<Object?> get props => [id, extension, url];

  factory ProductImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageResponseToJson(this);
}
