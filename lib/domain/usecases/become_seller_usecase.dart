import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/seller.dart';

@lazySingleton
class BecomeSellerUseCase implements BaseUseCase<Seller, NoParams> {
  final Repository _repo;
  BecomeSellerUseCase(this._repo);

  @override
  Future<Either<Failure, Seller>> call(NoParams params) async =>
      _repo.becomeSeller();
}
