part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ProductImageResponse extends Equatable
    implements DataResponse<ProductImage> {
  final String? id;
  final String? url;

  const ProductImageResponse({
    required this.id,
    required this.url,
  });

  @override
  ProductImage toDomain() {
    return ProductImage(
      id: id.orEmpty(),
      url: url != null ? "${Constants.productImagePath}url" : '',
    );
  }

  @override
  List<Object?> get props => [id, url];

  factory ProductImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductImageResponseFromJson(json);
}
