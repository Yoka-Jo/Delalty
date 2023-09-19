import '../../data/requests/add_product_to_recently_searched_request.dart';
import '../entities/comment.dart';
import '../entities/category_products.dart';
import '../entities/relationship.dart';
import '../entities/searched_products.dart';
import '../entities/user.dart';
import '../entities/no_data.dart';
import '../entities/product.dart';
import '../entities/category.dart';
import '../entities/auth_data.dart';
import 'package:dartz/dartz.dart';
import '../../data/requests/requests.dart';

import '../../core/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, AuthData>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, AuthData>> login(
    LoginRequest loginRequest,
  );
  Future<Either<Failure, AuthData>> facebookLogin();
  Future<Either<Failure, AuthData>> googleLogin();
  Future<Either<Failure, AuthData>> appleLogin();
  Future<Either<Failure, AuthData>> verifyPhone(
    VerifyPhoneRequest verifyPhoneRequest,
  );
  Future<Either<Failure, Category>> getCategory(
    GetCategoryRequest getCategoryRequest,
  );
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<String>>> getBestCategories();
  Future<Either<Failure, Product>> createProduct(
    CreateProductRequest createProductRequest,
  );
  Future<Either<Failure, NoData>> addProductToFavorites(
    AddProductToFavoritesRequest addProductToFavoritesRequest,
  );
  Future<Either<Failure, List<Product>>> getFavorites();
  Future<Either<Failure, User>> getUserData(
    GetUserDataRequest getUserDataRequest,
  );
  Future<Either<Failure, CategoryProducts>> getProductForCategory(
    GetProductsForCategoryRequest getProductForCategoryRequest,
  );
  Future<Either<Failure, NoData>> removeProductFromFavorites(
    RemoveProductFromFavoritesRequest removeProductFromFavoritesRequest,
  );
  Future<Either<Failure, Product>> getProduct(
    GetProductRequest getProductRequest,
  );
  Future<Either<Failure, Comment>> getProductSingleComment(
    GetProductSingleCommentRequest getProductSingleCommentRequest,
  );
  Future<Either<Failure, List<Comment>>> getProductComments(
    GetProductCommentsRequest getProductCommentsRequest,
  );
  Future<Either<Failure, SearchedProducts>> searchForProducts(
    SearchForProductsRequest searchForProductsRequest,
  );
  Future<Either<Failure, bool>> addProductToRecentlySearched(
    AddProductToRecentlySearchedRequest addProductToRecentlySearchedRequest,
  );
  Future<Either<Failure, List<Product>>> getRecentlySearchedProducts();
  Future<Either<Failure, List<Product>>> getSellerProducts(
    GetSellerProductsRequest getSellerProductsRequest,
  );
  Future<Either<Failure, RelationShip>> changeRelationshipType(
    ChangeRelationshipTypeRequest changeRelationshipTypeRequest,
  );
}
