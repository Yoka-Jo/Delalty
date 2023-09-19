part of 'requests.dart';

class GetProductsForCategoryRequest {
  final String categoryId;
  final Map<String, dynamic> query;

  GetProductsForCategoryRequest({
    required this.categoryId,
    this.query = const {},
  });
}
