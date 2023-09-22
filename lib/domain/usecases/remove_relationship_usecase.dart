import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../data/requests/requests.dart';
import '../../domain/entities/no_data.dart';
import '../repository/repository.dart';

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
