import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class GetSellerProductsUseCase
    implements BaseUseCase<List<Product>, GetSellerProductsRequest> {
  final Repository _repo;
  GetSellerProductsUseCase(this._repo);

  @override
  Future<Either<Failure, List<Product>>> call(
          GetSellerProductsRequest params) async =>
      _repo.getSellerProducts(params);
}
