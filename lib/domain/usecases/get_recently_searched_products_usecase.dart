import '../../core/network/failure.dart';
import 'package:injectable/injectable.dart';
import '../entities/product.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';

@injectable
class GetRecentlySearchedProductsUseCase
    implements BaseUseCase<List<Product>, NoParams> {
  final Repository _repo;
  GetRecentlySearchedProductsUseCase(this._repo);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async =>
      _repo.getRecentlySearchedProducts();
}
