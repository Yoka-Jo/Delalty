import '../entities/user.dart';
import '../entities/no_data.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/requests.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, NoData>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, User>> login(
    LoginRequest loginRequest,
  );
}
