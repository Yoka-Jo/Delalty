import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/comment.dart';

@lazySingleton
class GetProductSingleCommentUseCase
    implements BaseUseCase<Comment, GetProductSingleCommentRequest> {
  final Repository _repo;
  GetProductSingleCommentUseCase(this._repo);

  @override
  Future<Either<Failure, Comment>> call(
          GetProductSingleCommentRequest params) async =>
      _repo.getProductSingleComment(params);
}
