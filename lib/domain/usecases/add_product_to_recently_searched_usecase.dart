import '../../data/requests/add_product_to_recently_searched_request.dart';
import '../../core/network/failure.dart';
import 'package:injectable/injectable.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';

@injectable
class AddProductToRecentlySearchedUseCase
    implements BaseUseCase<bool, AddProductToRecentlySearchedRequest> {
  final Repository _repo;
  AddProductToRecentlySearchedUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> call(
          AddProductToRecentlySearchedRequest params) async =>
      _repo.addProductToRecentlySearched(params);
}
