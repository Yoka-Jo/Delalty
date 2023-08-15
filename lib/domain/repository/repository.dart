import 'package:dartz/dartz.dart';
import '../../data/network/requests.dart';

import '../../data/network/failure.dart';
import '../entities/user.dart';

abstract class Repository {
  Future<Either<Failure, User>> login(LoginRequest loginRequest);
}
