import '../../domain/entities/product.dart';

class AddProductToRecentlySearchedRequest {
  final Product product;

  AddProductToRecentlySearchedRequest(
    this.product,
  );
}
