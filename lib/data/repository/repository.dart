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
  Future<void> _storeUserToken(AuthData token) async {
    await getIt<UserSecureStorage>().upsertUserToken(token.accessToken);
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
      statusCode: 200,
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
}
