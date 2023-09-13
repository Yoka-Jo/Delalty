import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/user.dart';

@lazySingleton
class GetUserDataUseCase implements BaseUseCase<User, GetUserDataRequest> {
  final Repository _repo;
  GetUserDataUseCase(this._repo);

  @override
  Future<Either<Failure, User>> call(GetUserDataRequest params) async =>
      _repo.getUserData(params);
}
