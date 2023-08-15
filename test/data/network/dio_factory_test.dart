import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:delalty/data/network/dio_factory.dart';

void main() {
  late DioFactory dioFactory;
  late Dio dio;

  setUp(() {
    dioFactory = DioFactory();
    dio = dioFactory.getDio();
  });

  test(
    "dio should has application/json as header",
    () async {
      expect(
        dio.options.headers,
        {
          contentType: applicationJson,
          accept: applicationJson,
        },
      );
    },
  );

  test(
    "dio should has interceptors",
    () async {
      expect(dio.interceptors, isNotEmpty);
    },
  );
}
