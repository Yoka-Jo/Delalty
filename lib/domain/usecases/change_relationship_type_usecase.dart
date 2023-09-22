import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../data/requests/requests.dart';
import '../entities/relationship.dart';
import '../repository/repository.dart';

@lazySingleton
class ChangeRelationshipTypeUseCase
    implements BaseUseCase<RelationShip, ChangeRelationshipTypeRequest> {
  final Repository _repo;
  ChangeRelationshipTypeUseCase(this._repo);

  @override
  Future<Either<Failure, RelationShip>> call(
          ChangeRelationshipTypeRequest params) async =>
      _repo.changeRelationshipType(params);
}
