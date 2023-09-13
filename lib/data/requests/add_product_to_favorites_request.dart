part of 'requests.dart';

@JsonSerializable(createFactory: false)
class AddProductToFavoritesRequest {
  @JsonKey(name: 'product_id')
  final String productId;

  AddProductToFavoritesRequest({
    required this.productId,
  });

  Map<String, dynamic> toJson() => _$AddProductToFavoritesRequestToJson(this);
}
