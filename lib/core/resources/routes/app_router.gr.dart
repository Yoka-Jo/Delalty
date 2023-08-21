// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountSetupScreen(),
      );
    },
    AppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppScreen(),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseLanguageScreen(),
      );
    },
    ConversationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConversationScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapScreen(
          key: args.key,
          longitude: args.longitude,
          latitude: args.latitude,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    PropertyFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PropertyFilterScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SetAlertsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetAlertsScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    UserPrivacyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserPrivacyScreen(),
      );
    },
    VerificationCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerificationCodeScreen(),
      );
    },
    ViewProductSectionRoute.name: (routeData) {
      final args = routeData.argsAs<ViewProductSectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewProductSectionScreen(
          key: args.key,
          isRealEstate: args.isRealEstate,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [AccountSetupScreen]
class AccountSetupRoute extends PageRouteInfo<void> {
  const AccountSetupRoute({List<PageRouteInfo>? children})
      : super(
          AccountSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseLanguageScreen]
class ChooseLanguageRoute extends PageRouteInfo<void> {
  const ChooseLanguageRoute({List<PageRouteInfo>? children})
      : super(
          ChooseLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseLanguageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConversationScreen]
class ConversationRoute extends PageRouteInfo<void> {
  const ConversationRoute({List<PageRouteInfo>? children})
      : super(
          ConversationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConversationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<MapRouteArgs> {
  MapRoute({
    Key? key,
    required double longitude,
    required double latitude,
    List<PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            longitude: longitude,
            latitude: latitude,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<MapRouteArgs> page = PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.longitude,
    required this.latitude,
  });

  final Key? key;

  final double longitude;

  final double latitude;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, longitude: $longitude, latitude: $latitude}';
  }
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<void> {
  const ProductRoute({List<PageRouteInfo>? children})
      : super(
          ProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PropertyFilterScreen]
class PropertyFilterRoute extends PageRouteInfo<void> {
  const PropertyFilterRoute({List<PageRouteInfo>? children})
      : super(
          PropertyFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'PropertyFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetAlertsScreen]
class SetAlertsRoute extends PageRouteInfo<void> {
  const SetAlertsRoute({List<PageRouteInfo>? children})
      : super(
          SetAlertsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetAlertsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserPrivacyScreen]
class UserPrivacyRoute extends PageRouteInfo<void> {
  const UserPrivacyRoute({List<PageRouteInfo>? children})
      : super(
          UserPrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserPrivacyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationCodeScreen]
class VerificationCodeRoute extends PageRouteInfo<void> {
  const VerificationCodeRoute({List<PageRouteInfo>? children})
      : super(
          VerificationCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationCodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewProductSectionScreen]
class ViewProductSectionRoute
    extends PageRouteInfo<ViewProductSectionRouteArgs> {
  ViewProductSectionRoute({
    Key? key,
    bool isRealEstate = false,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          ViewProductSectionRoute.name,
          args: ViewProductSectionRouteArgs(
            key: key,
            isRealEstate: isRealEstate,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewProductSectionRoute';

  static const PageInfo<ViewProductSectionRouteArgs> page =
      PageInfo<ViewProductSectionRouteArgs>(name);
}

class ViewProductSectionRouteArgs {
  const ViewProductSectionRouteArgs({
    this.key,
    this.isRealEstate = false,
    required this.title,
  });

  final Key? key;

  final bool isRealEstate;

  final String title;

  @override
  String toString() {
    return 'ViewProductSectionRouteArgs{key: $key, isRealEstate: $isRealEstate, title: $title}';
  }
}
