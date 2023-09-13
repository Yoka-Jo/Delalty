import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/auth_data.dart';

@lazySingleton
class VerifyPhoneUseCase implements BaseUseCase<AuthData, VerifyPhoneRequest> {
  final Repository _repo;
  VerifyPhoneUseCase(this._repo);

  @override
  Future<Either<Failure, AuthData>> call(VerifyPhoneRequest params) async =>
      _repo.verifyPhone(params);
}
