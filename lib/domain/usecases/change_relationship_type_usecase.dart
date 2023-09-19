import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/relation_ship.dart';

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
