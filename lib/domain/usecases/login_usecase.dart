import 'package:injectable/injectable.dart';

import '../../data/network/requests.dart';
import '../entities/user.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';

@lazySingleton
class LoginUseCase implements BaseUseCase<User, LoginRequest> {
  final Repository _repo;
  LoginUseCase(this._repo);

  @override
  Future<Either<Failure, User>> call(LoginRequest params) async =>
      _repo.login(params);
}
