import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/category.dart';

@lazySingleton
class GetCategoryUseCase implements BaseUseCase<Category, GetCategoryRequest> {
  final Repository _repo;
  GetCategoryUseCase(this._repo);

  @override
  Future<Either<Failure, Category>> call(GetCategoryRequest params) async =>
      _repo.getCategory(params);
}
