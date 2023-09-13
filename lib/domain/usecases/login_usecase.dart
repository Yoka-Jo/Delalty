import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/auth_data.dart';

@lazySingleton
class LoginUseCase implements BaseUseCase<AuthData, LoginRequest> {
  final Repository _repo;
  LoginUseCase(this._repo);

  @override
  Future<Either<Failure, AuthData>> call(LoginRequest params) async =>
      _repo.login(params);
}
