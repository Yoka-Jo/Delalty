import '../entities/category.dart';
import '../entities/auth_data.dart';
import 'package:dartz/dartz.dart';
import '../../data/requests/requests.dart';

import '../../core/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, AuthData>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, AuthData>> login(
    LoginRequest loginRequest,
  );
  Future<Either<Failure, AuthData>> facebookLogin();
  Future<Either<Failure, AuthData>> googleLogin();
  Future<Either<Failure, AuthData>> appleLogin();
  Future<Either<Failure, AuthData>> verifyPhone(
    VerifyPhoneRequest verifyPhoneRequest,
  );
  Future<Either<Failure, Category>> getCategory(
    GetCategoryRequest getCategoryRequest,
  );
}
