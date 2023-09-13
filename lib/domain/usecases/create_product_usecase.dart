import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class CreateProductUseCase
    implements BaseUseCase<Product, CreateProductRequest> {
  final Repository _repo;
  CreateProductUseCase(this._repo);

  @override
  Future<Either<Failure, Product>> call(CreateProductRequest params) async =>
      _repo.createProduct(params);
}
