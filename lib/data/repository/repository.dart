import '../../domain/entities/user.dart';
import '../../domain/entities/no_data.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:delalty/data/repository/repository_helpers.dart';

import '../../data/datasources/remote_datasource/app_api.dart';
import '../../data/network/requests.dart';
import '../../domain/repository/repository.dart';
import '../network/failure.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final AppServiceClient _appServiceClient;
  final RepositoryHelpers _repositoryHelpers;

  RepositoryImpl(this._appServiceClient)
      : _repositoryHelpers = RepositoryHelpers();

  @override
  Future<Either<Failure, NoData>> register(
    RegisterRequest registerRequest,
  ) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.register(
        registerRequest,
      ),
      statusCode: 201,
    );
  }

  @override
  Future<Either<Failure, User>> login(
    LoginRequest loginRequest,
  ) async {
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.login(
        loginRequest,
      ),
      statusCode: 200,
    );
  }
}
