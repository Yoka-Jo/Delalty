import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constants.dart';
import '../../../core/models/responses.dart';
import '../../requests/requests.dart';

part "app_api.g.dart";

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST(Constants.registerPath)
  Future<HttpResponse<AuthDataResponse>> register(
    @Body() RegisterRequest registerRequest,
  );
  @POST(Constants.loginPath)
  Future<HttpResponse<AuthDataResponse>> login(
    @Body() LoginRequest loginRequest,
  );
  @POST(Constants.facebookLoginPath)
  Future<HttpResponse<AuthDataResponse>> facebookLogin();
  @POST(Constants.googleLoginPath)
  Future<HttpResponse<AuthDataResponse>> googleLogin();
  @POST(Constants.appleLoginPath)
  Future<HttpResponse<AuthDataResponse>> appleLogin();
  @POST(Constants.verifyPhonePath)
  Future<HttpResponse<AuthDataResponse>> verifyPhone(
    @Body() VerifyPhoneRequest verifyPhoneRequest,
  );
  @GET(Constants.getCategoryPath)
  Future<HttpResponse<CategoryResponse>> getCategory(
    @Path() String id,
  );
  @GET(Constants.getCategoriesPath)
  Future<HttpResponse<List<CategoryResponse>>> getCategories();
  @GET(Constants.getBestCategoriesPath)
  Future<HttpResponse<List<String>>> getBestCategories();
  @POST(Constants.createProductPath)
  @MultiPart()
  Future<HttpResponse<ProductResponse>> createProduct(
    @Part() String title,
    @Part() String description,
    @Part() double price,
    @Part() int categoryId,
    @Part() int mainImageIndex,
    @Part() File file,
  );
  @POST(Constants.addProductToFavoritesPath)
  Future<HttpResponse<void>> addProductToFavorites(
    @Body() AddProductToFavoritesRequest addProductToFavoritesRequest,
    @Path('product_id') String productId,
  );
  @GET(Constants.getFavoritesPath)
  Future<HttpResponse<List<ProductResponse>>> getFavorites();
  @GET(Constants.getUserDataPath)
  Future<HttpResponse<UserResponse>> getUserData(
    @Path() String id,
  );
  @GET(Constants.getProductForCategoryPath)
  Future<HttpResponse<CategoryProductsResponse>> getProductForCategory(
    @Query('category_id') String categoryId,
    @Queries() Map<String, dynamic> query,
  );
  @DELETE(Constants.removeProductFromFavoritesPath)
  Future<HttpResponse<void>> removeProductFromFavorites(
    @Path('product_id') String productId,
  );
  @GET(Constants.getProductPath)
  Future<HttpResponse<ProductResponse>> getProduct(
    @Path() String id,
  );
  @GET(Constants.getProductSingleCommentPath)
  Future<HttpResponse<CommentResponse>> getProductSingleComment(
    @Path('product_id') String productId,
    @Path() String id,
  );
  @GET(Constants.getProductCommentsPath)
  Future<HttpResponse<List<CommentResponse>>> getProductComments(
    @Path('product_id') int productId,
    @Queries() Map<String, dynamic> query,
  );
  @GET(Constants.searchForProductsPath)
  Future<HttpResponse<SearchedProductsResponse>> searchForProducts(
    @Queries() Map<String, dynamic> query,
  );
  @GET(Constants.getSellerProductsPath)
  Future<HttpResponse<List<ProductResponse>>> getSellerProducts(
    @Path() String id,
  );
  @PATCH(Constants.changeRelationshipTypePath)
  Future<HttpResponse<RelationShipResponse>> changeRelationshipType(
    @Body() ChangeRelationshipTypeRequest changeRelationshipTypeRequest,
    @Path() String targetId,
  );
}
