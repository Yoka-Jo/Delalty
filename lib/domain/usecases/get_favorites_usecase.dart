import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/product.dart';

@lazySingleton
class GetFavoritesUseCase implements BaseUseCase<List<Product>, NoParams> {
  final Repository _repo;
  GetFavoritesUseCase(this._repo);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async =>
      _repo.getFavorites();
}
