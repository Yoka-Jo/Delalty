import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/base_usecase.dart';
import '../../core/network/failure.dart';
import '../../data/requests/requests.dart';
import '../../domain/entities/product.dart';
import '../repository/repository.dart';

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
