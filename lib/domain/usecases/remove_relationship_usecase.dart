import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/no_data.dart';

@lazySingleton
class RemoveRelationshipUseCase
    implements BaseUseCase<NoData, RemoveRelationshipRequest> {
  final Repository _repo;
  RemoveRelationshipUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(
          RemoveRelationshipRequest params) async =>
      _repo.removeRelationship(params);
}
