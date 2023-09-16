import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../entities/searched_products.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class SearchForProductsUseCase
    implements BaseUseCase<SearchedProducts, SearchForProductsRequest> {
  final Repository _repo;
  SearchForProductsUseCase(this._repo);

  @override
  Future<Either<Failure, SearchedProducts>> call(
          SearchForProductsRequest params) async =>
      _repo.searchForProducts(params);
}
