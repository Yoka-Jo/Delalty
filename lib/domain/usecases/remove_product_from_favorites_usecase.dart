import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/no_data.dart';

@lazySingleton
class RemoveProductFromFavoritesUseCase
    implements BaseUseCase<NoData, RemoveProductFromFavoritesRequest> {
  final Repository _repo;
  RemoveProductFromFavoritesUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(
          RemoveProductFromFavoritesRequest params) async =>
      _repo.removeProductFromFavorites(params);
}
