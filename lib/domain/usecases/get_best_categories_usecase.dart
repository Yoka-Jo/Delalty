import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetBestCategoriesUseCase implements BaseUseCase<List<String>, NoParams> {
  final Repository _repo;
  GetBestCategoriesUseCase(this._repo);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async =>
      _repo.getBestCategories();
}
