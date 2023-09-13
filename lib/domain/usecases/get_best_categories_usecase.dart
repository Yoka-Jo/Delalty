import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/category.dart';

@lazySingleton
class GetBestCategoriesUseCase
    implements BaseUseCase<List<Category>, NoParams> {
  final Repository _repo;
  GetBestCategoriesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async =>
      _repo.getBestCategories();
}
