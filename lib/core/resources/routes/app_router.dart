// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../presentation/screens/account_setup/account_setup_screen.dart';
import '../../../presentation/screens/app/app_screen.dart';
import '../../../presentation/screens/choose_language/choose_language_screen.dart';
import '../../../presentation/screens/conversation/conversation_screen.dart';
import '../../../presentation/screens/favorite/favorite_screen.dart';
import '../../../presentation/screens/login/login_screen.dart';
import '../../../presentation/screens/map/views/map_screen.dart';
import '../../../presentation/screens/notifications/notifications_screen.dart';
import '../../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../../presentation/screens/product/product_screen.dart';
import '../../../presentation/screens/profile/profile_screen.dart';
import '../../../presentation/screens/property_filter/property_filter_screen.dart';
import '../../../presentation/screens/search/search_screen.dart';
import '../../../presentation/screens/set_alerts/set_alerts_screen.dart';
import '../../../presentation/screens/signup/signup_screen.dart';
import '../../../presentation/screens/splash/splash_screen.dart';
import '../../../presentation/screens/user_privacy/user_privacy_screen.dart';
import '../../../presentation/screens/verification_code/verification_code_screen.dart';
import '../../../presentation/screens/view_product_section/view_product_section_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final GlobalKey<NavigatorState> navigationKey;
  AppRouter(
    this.navigationKey,
  ) : super(navigatorKey: navigationKey);

  @override
  List<AutoRoute> get routes => [
        MaterialRoute(page: SplashRoute.page, initial: true),
        MaterialRoute(page: ChooseLanguageRoute.page),
        MaterialRoute(page: OnBoardingRoute.page),
        MaterialRoute(page: SignupRoute.page),
        MaterialRoute(page: LoginRoute.page),
        MaterialRoute(page: FavoriteRoute.page),
        MaterialRoute(page: VerificationCodeRoute.page),
        MaterialRoute(page: ProfileRoute.page),
        MaterialRoute(page: AppRoute.page),
        MaterialRoute(page: PropertyFilterRoute.page),
        MaterialRoute(page: MapRoute.page),
        MaterialRoute(page: ViewProductSectionRoute.page),
        MaterialRoute(page: ConversationRoute.page),
        MaterialRoute(page: SearchRoute.page),
        MaterialRoute(page: SetAlertsRoute.page),
        MaterialRoute(page: UserPrivacyRoute.page),
        MaterialRoute(page: AccountSetupRoute.page),
        MaterialRoute(page: ProductRoute.page),
        CustomRoute(
          page: NotificationsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
      ];
}
