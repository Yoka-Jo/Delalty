import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/no_data.dart';

@lazySingleton
class AddProductToFavoritesUseCase
    implements BaseUseCase<NoData, AddProductToFavoritesRequest> {
  final Repository _repo;
  AddProductToFavoritesUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(
          AddProductToFavoritesRequest params) async =>
      _repo.addProductToFavorites(params);
}
