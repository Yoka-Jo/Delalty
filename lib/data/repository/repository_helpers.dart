import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/check_internet_connection.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../responses/responses.dart';

class RepositoryHelpers {
  Future<Either<Failure, T>> callApi<T>(
    Future<HttpResponse> Function() function, {
    required int statusCode,

    /// use it when you need to return list
    T Function(List list)? convertToAppropriateList,
    Future<void> Function(T data)? onData,
  }) async {
    assert(
      T is List ? (convertToAppropriateList == null ? false : true) : true,
      'Please provide convertToAppropriateList if you are returning list.',
    );

    if (!(await isConnected())) {
      return _retrunFailureIfNoInternetConnection<T>();
    }

    try {
      final result = await function();

      if (result.response.statusCode == statusCode) {
        return _returnListOfItems(result, convertToAppropriateList, onData);
      } else {
        return _returnFailureIfStatusCodeIsNotSuccess<T>(result);
      }
    } catch (e) {
      log("||||||||||||||||||||ERROR FROM REPOSITORY CALLAPI||||||||||||||||||||");
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Left<Failure, T> _retrunFailureIfNoInternetConnection<T>() {
    return Left(Failure(
      code: ResponseCode.noInternetConnection,
      message: ResponseMessage.noInternetConnection,
    ));
  }

  Left<Failure, T> _returnFailureIfStatusCodeIsNotSuccess<T>(
      HttpResponse<dynamic> result) {
    return Left(
      Failure(
        code: result.response.statusCode ?? 0,
        message: result.response.statusMessage ?? ResponseMessage.defaultt,
      ),
    );
  }

  Future<Right<Failure, T>> _returnListOfItems<T>(
    HttpResponse<dynamic> result,
    T Function(List list)? convertToAppropriateList,
    Future<void> Function(T data)? onData,
  ) async {
    late final dynamic domainValue;
    dynamic data = result.data;
    if (data is List) {
      domainValue = convertToAppropriateList!(data.map((element) {
        return (element as DataResponse).toDomain();
      }).toList());
    } else {
      domainValue = data.toDomain();
    }
    log("domainValue: $domainValue");
    if (onData != null) {
      await onData(domainValue);
    }
    return Right(domainValue);
  }
}
