import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/core/user_secure_storage.dart';
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart';
import 'package:delalty/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    PageRouteInfo<void> route;
    Timer(
      const Duration(milliseconds: 1500),
      () async {
        final token = await getIt<UserSecureStorage>().getUserToken();
        if (token == null) {
          final sharedPrefs = getIt<LocalDataSource>();
          if (!sharedPrefs.containsKey(key: 'lang')) {
            route = const ChooseLanguageRoute();
          } else if (!sharedPrefs.getIsOnBoardingScreenViewed()) {
            route = const OnBoardingRoute();
          } else {
            route = LoginRoute();
          }
        } else {
          route = const AppRoute();
        }
        if (context.mounted) {
          context.router.replace(route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SimpleText(
          AppStrings.appName,
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 36.sp,
        ),
      ),
    );
  }
}
