import 'package:delalty/core/network/error_handler.dart';
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart';
import 'package:delalty/data/requests/add_product_to_recently_searched_request.dart';
import 'package:delalty/data/requests/get_recently_searched_products_request.dart';

import '../../core/models/responses.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/category_products.dart';
import '../../domain/entities/searched_products.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/no_data.dart';
import 'dart:io';
import '../../domain/entities/product.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/auth_data.dart';
import '../../core/user_secure_storage.dart';
import '../../di.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:delalty/data/repository/repository_helpers.dart';

import '../../data/datasources/remote_datasource/app_api.dart';
import '../requests/requests.dart';
import '../../domain/repository/repository.dart';
import '../../core/network/failure.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final AppServiceClient _appServiceClient;
  final LocalDataSource _localDataSource;
  final RepositoryHelpers _repositoryHelpers;

  RepositoryImpl(this._appServiceClient, this._localDataSource)
      : _repositoryHelpers = RepositoryHelpers();

  // Future<void> _storeUserData(User user) async {
  //   await getIt<UserSecureStorage>().upsertUserInfo(user);
  // }
  Future<void> _storeUserTokenAndId(AuthData authData) async {
    await getIt<UserSecureStorage>()
        .upsertUserTokenAndId(authData.accessToken, authData.userId);
  }

  @override
  Future<Either<Failure, AuthData>> register(
    RegisterRequest registerRequest,
  ) async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.register(
        registerRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AuthData>> login(
    LoginRequest loginRequest,
  ) async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.login(
        loginRequest,
      ),
      statusCode: 201,
      onData: _storeUserTokenAndId,
    );
  }

  @override
  Future<Either<Failure, AuthData>> facebookLogin() async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.facebookLogin(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AuthData>> googleLogin() async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.googleLogin(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AuthData>> appleLogin() async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.appleLogin(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AuthData>> verifyPhone(
    VerifyPhoneRequest verifyPhoneRequest,
  ) async {
    return _repositoryHelpers.callApi<AuthData>(
      () => _appServiceClient.verifyPhone(
        verifyPhoneRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, Category>> getCategory(
    GetCategoryRequest getCategoryRequest,
  ) async {
    return _repositoryHelpers.callApi<Category>(
      () => _appServiceClient.getCategory(
        getCategoryRequest.id,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    return _repositoryHelpers.callApi<List<Category>>(
      () => _appServiceClient.getCategories(),
      statusCode: 200,
      convertToAppropriateList: List<Category>.from,
    );
  }

  @override
  Future<Either<Failure, List<String>>> getBestCategories() async {
    return _repositoryHelpers.callApi<List<String>>(
      () => _appServiceClient.getBestCategories(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, Product>> createProduct(
    CreateProductRequest createProductRequest,
  ) async {
    return _repositoryHelpers.callApi<Product>(
      () => _appServiceClient.createProduct(
        createProductRequest.title,
        createProductRequest.description,
        createProductRequest.price,
        createProductRequest.categoryId,
        createProductRequest.mainImageIndex,
        File(createProductRequest.file),
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> addProductToFavorites(
    AddProductToFavoritesRequest addProductToFavoritesRequest,
  ) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.addProductToFavorites(
        addProductToFavoritesRequest,
        addProductToFavoritesRequest.productId,
      ),
      statusCode: 201,
    );
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() async {
    return _repositoryHelpers.callApi<List<Product>>(
      () => _appServiceClient.getFavorites(),
      statusCode: 200,
      convertToAppropriateList: List<Product>.from,
    );
  }

  @override
  Future<Either<Failure, User>> getUserData(
    GetUserDataRequest getUserDataRequest,
  ) async {
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.getUserData(
        getUserDataRequest.id,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, CategoryProducts>> getProductForCategory(
    GetProductsForCategoryRequest getProductForCategoryRequest,
  ) async {
    return _repositoryHelpers.callApi<CategoryProducts>(
      () => _appServiceClient.getProductForCategory(
        getProductForCategoryRequest.categoryId,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> removeProductFromFavorites(
    RemoveProductFromFavoritesRequest removeProductFromFavoritesRequest,
  ) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.removeProductFromFavorites(
        removeProductFromFavoritesRequest.productId,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, Product>> getProduct(
    GetProductRequest getProductRequest,
  ) async {
    return _repositoryHelpers.callApi<Product>(
      () => _appServiceClient.getProduct(
        getProductRequest.id,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, Comment>> getProductSingleComment(
    GetProductSingleCommentRequest getProductSingleCommentRequest,
  ) async {
    return _repositoryHelpers.callApi<Comment>(
      () => _appServiceClient.getProductSingleComment(
        getProductSingleCommentRequest.product_id,
        getProductSingleCommentRequest.id,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, List<Comment>>> getProductComments(
    GetProductCommentsRequest getProductCommentsRequest,
  ) async {
    return _repositoryHelpers.callApi<List<Comment>>(
      () => _appServiceClient.getProductComments(
        getProductCommentsRequest.product_id,
        getProductCommentsRequest.query,
      ),
      statusCode: 200,
      convertToAppropriateList: List<Comment>.from,
    );
  }

  @override
  Future<Either<Failure, SearchedProducts>> searchForProducts(
    SearchForProductsRequest searchForProductsRequest,
  ) async {
    return _repositoryHelpers.callApi<SearchedProducts>(
      () => _appServiceClient.searchForProducts(
        searchForProductsRequest.query,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, bool>> addProductToRecentlySearched(
      AddProductToRecentlySearchedRequest
          addProductToRecentlySearchedRequest) async {
    final res = await _localDataSource.saveRecentlySearchedProduct(
        addProductToRecentlySearchedRequest.product);
    if (res == false) {
      return Left(Failure(
          code: ResponseCode.cacheError,
          message: 'Something went wrong in caching.'));
    } else {
      return const Right(true);
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getRecentlySearchedProducts() async {
    final res = await _localDataSource.getRecentlySearchedProducts();
    return Right(res);
  }
}
