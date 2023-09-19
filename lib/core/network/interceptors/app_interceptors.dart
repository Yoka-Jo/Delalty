import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/resources/app_context.dart';
import 'package:dio/dio.dart';
import 'package:delalty/core/user_secure_storage.dart';
import 'package:delalty/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/components/widgets/simple_text.dart';
import '../../resources/routes/app_router.dart';
import '../../resources/strings_manager.dart';

class AppInterceptors extends Interceptor {
  final Dio client;
  // final AuthLocalDataSource authLocalDataSource;
  AppInterceptors({required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;

    String? userToken = await getIt<UserSecureStorage>().getUserToken();

    if (userToken != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          AppStrings.bearer + userToken;
    }
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   debugPrint(
  //       'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  //   super.onResponse(response, handler);
  // }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      await showDialogForLoginAgain();
    }
    super.onError(err, handler);
  }

  Future<void> showDialogForLoginAgain() async {
    final context = AppContext.context;
    showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: SimpleText(
          AppStrings.sessionExpired.tr(context: context),
          textStyle: TextStyleEnum.montserratBold,
          fontSize: 18.sp,
        ),
        content: SimpleText(
          AppStrings.pleaseLoginAgain.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
        actions: [
          TextButton(
            onPressed: () => context.router.replaceAll([LoginRoute()]),
            child: SimpleText(
              AppStrings.ok.tr(context: context),
              textStyle: TextStyleEnum.montserratBold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return client.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }

  // Future<bool> _refreshToken(String userToken, String userRefreshToken) async {
  //   final response = await client.post(EndPoints.refreshToken, data: {
  //     AppStrings.token: userToken,
  //     AppStrings.refreshToken: userRefreshToken,
  //   });
  //   final jsonResponse = Commons.decodeJson(response);
  //   BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);
  //   if (baseResponse.isSuccess!) {
  //     userToken = baseResponse.data["token"];
  //     userRefreshToken = baseResponse.data["refreshToken"];
  //     getIt<UserSecureStorage>().upsertUserInfo(username: username, email: email);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
