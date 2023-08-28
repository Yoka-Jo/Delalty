import 'package:injectable/injectable.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../domain/entities/no_data.dart';

@lazySingleton
class RegisterUseCase implements BaseUseCase<NoData, RegisterRequest> {
  final Repository _repo;
  RegisterUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(RegisterRequest params) async =>
      _repo.register(params);
}
