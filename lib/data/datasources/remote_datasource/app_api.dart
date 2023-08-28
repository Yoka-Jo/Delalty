import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constants.dart';
import '../../network/requests.dart';
import '../../responses/responses.dart';

part "app_api.g.dart";

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.registerPath)
  Future<HttpResponse<NoDataResponse>> register(
    @Body() RegisterRequest registerRequest,
  );
  @POST(Constants.loginPath)
  Future<HttpResponse<UserResponse>> login(
    @Body() LoginRequest loginRequest,
  );
}
