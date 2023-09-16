import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/comment.dart';

@lazySingleton
class GetProductCommentsUseCase
    implements BaseUseCase<List<Comment>, GetProductCommentsRequest> {
  final Repository _repo;
  GetProductCommentsUseCase(this._repo);

  @override
  Future<Either<Failure, List<Comment>>> call(
          GetProductCommentsRequest params) async =>
      _repo.getProductComments(params);
}
