import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/auth_data.dart';

@lazySingleton
class FacebookLoginUseCase implements BaseUseCase<AuthData, NoParams> {
  final Repository _repo;
  FacebookLoginUseCase(this._repo);

  @override
  Future<Either<Failure, AuthData>> call(NoParams params) async =>
      _repo.facebookLogin();
}
