import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class GetProductUseCase implements BaseUseCase<Product, GetProductRequest> {
  final Repository _repo;
  GetProductUseCase(this._repo);

  @override
  Future<Either<Failure, Product>> call(GetProductRequest params) async =>
      _repo.getProduct(params);
}
