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
  final RepositoryHelpers _repositoryHelpers;

  RepositoryImpl(this._appServiceClient)
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
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() async {
    return _repositoryHelpers.callApi<List<Product>>(
      () => _appServiceClient.getFavorites(),
      statusCode: 200,
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
  Future<Either<Failure, List<Product>>> getProductForCategory(
    GetProductsForCategoryRequest getProductForCategoryRequest,
  ) async {
    return _repositoryHelpers.callApi<List<Product>>(
      () => _appServiceClient.getProductForCategory(
        getProductForCategoryRequest.categoryId,
      ),
      statusCode: 200,
    );
  }
}
