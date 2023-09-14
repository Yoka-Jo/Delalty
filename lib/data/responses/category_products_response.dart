// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class CategoryProductsResponse extends Equatable
    implements DataResponse<CategoryProducts> {
  final List<ProductResponse>? data;
  final int? total;

  const CategoryProductsResponse({
    this.data,
    this.total,
  });

  @override
  CategoryProducts toDomain() {
    return CategoryProducts(
      products: data?.map((e) => e.toDomain()).toList() ?? [],
      total: total.orZero(),
    );
  }

  @override
  List<Object?> get props => [data, total];

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductsResponseFromJson(json);
}
