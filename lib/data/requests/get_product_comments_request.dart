part of 'requests.dart';

class GetProductCommentsRequest {
  final Map<String, dynamic> query;
  final int product_id;

  GetProductCommentsRequest({
    required this.product_id,
    this.query = const {},
  });
}
