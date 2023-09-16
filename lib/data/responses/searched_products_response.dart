// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SearchedProductsResponse extends Equatable
    implements DataResponse<SearchedProducts> {
  final List<ProductResponse>? data;
  final int? total;

  const SearchedProductsResponse({
    this.data,
    this.total,
  });

  @override
  SearchedProducts toDomain() {
    return SearchedProducts(
      products: data?.map((e) => e.toDomain()).toList() ?? [],
      total: total.orZero(),
    );
  }

  @override
  List<Object?> get props => [data, total];

  factory SearchedProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchedProductsResponseFromJson(json);
}
