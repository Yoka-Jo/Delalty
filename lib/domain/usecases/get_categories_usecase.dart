import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/category.dart';
import '../repository/repository.dart';

@lazySingleton
class GetCategoriesUseCase implements BaseUseCase<List<Category>, NoParams> {
  final Repository _repo;
  GetCategoriesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async =>
      _repo.getCategories();
}
