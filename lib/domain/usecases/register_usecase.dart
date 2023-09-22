import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../data/requests/requests.dart';
import '../../domain/entities/auth_data.dart';
import '../repository/repository.dart';

@lazySingleton
class RegisterUseCase implements BaseUseCase<AuthData, RegisterRequest> {
  final Repository _repo;
  RegisterUseCase(this._repo);

  @override
  Future<Either<Failure, AuthData>> call(RegisterRequest params) async =>
      _repo.register(params);
}
