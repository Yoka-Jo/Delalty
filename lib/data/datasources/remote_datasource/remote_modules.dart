import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constants.dart';
import '../../../di.dart';
import 'app_api.dart';

@module
abstract class InjectableAppServiceClientModule {
  @lazySingleton
  AppServiceClient get appServiceClient =>
      AppServiceClient(getIt<Dio>(), baseUrl: Constants.baseUrl);
}
