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
  Future<HttpResponse<List<CategoryResponse>>> getBestCategories();
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
  Future<HttpResponse<NoDataResponse>> addProductToFavorites(
    @Body() AddProductToFavoritesRequest addProductToFavoritesRequest,
    @Path() String product_id,
  );
  @GET(Constants.getFavoritesPath)
  Future<HttpResponse<List<ProductResponse>>> getFavorites();
}
