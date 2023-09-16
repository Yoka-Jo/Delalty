import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:delalty/data/datasources/remote_datasource/app_api.dart';
import 'package:delalty/data/repository/repository.dart';
import 'package:delalty/domain/repository/repository.dart';

void main() {
  late final Dio dio;
  late final DioAdapter dioAdapter;
  late final AppServiceClient appServiceClient;
  late final Repository sut;

  setUp(
    () {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);
      appServiceClient = AppServiceClient(dio);
      // sut = RepositoryImpl(appServiceClient);
    },
  );
}
