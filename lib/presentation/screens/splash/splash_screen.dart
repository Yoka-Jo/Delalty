import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/simple_text.dart';
import '../../../core/resources/routes/app_router.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/services/dynamic_link_service.dart';
import '../../../core/user_secure_storage.dart';
import '../../../data/datasources/local_datasource/local_datasource.dart';
import '../../../di.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _dynamicLinkService = DynamicLinkService();

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    PageRouteInfo<void> route;
    PageRouteInfo<void>? dynamicLinkPage;
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
          dynamicLinkPage = await _openInitialDynamicLinkIfAny();
        }
        if (context.mounted) {
          if (dynamicLinkPage != null) {
            context.router.replaceAll([route, dynamicLinkPage!]);
          } else {
            context.router.replace(route);
          }
        }
      },
    );
  }

  Future<PageRouteInfo<void>?> _openInitialDynamicLinkIfAny() async {
    final path = await _dynamicLinkService.getInitialDynamicLinkPath();
    log('_openInitialDynamicLinkIfAny: $path');

    if (path != null) {
      if (path.contains('product')) {
        return ProductRoute(productId: path.split('/').last);
      }
      if (path.contains('profile')) {
        return SellerProfileRoute(sellerId: path.split('/').last);
      }
    }
    return null;
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
