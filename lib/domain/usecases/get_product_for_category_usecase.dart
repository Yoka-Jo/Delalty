import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class GetProductForCategoryUseCase
    implements BaseUseCase<List<Product>, GetProductsForCategoryRequest> {
  final Repository _repo;
  GetProductForCategoryUseCase(this._repo);

  @override
  Future<Either<Failure, List<Product>>> call(
          GetProductsForCategoryRequest params) async =>
      _repo.getProductForCategory(params);
}
