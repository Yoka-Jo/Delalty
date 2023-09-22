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
    AccountVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountVerificationScreen(),
      );
    },
    AddYourProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddYourProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddYourProductScreen(
          key: args.key,
          category: args.category,
        ),
      );
    },
    AdvertisingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdvertisingScreen(),
      );
    },
    AllDepartmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AllDepartmentsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllDepartmentsScreen(
          key: args.key,
          homeCubit: args.homeCubit,
        ),
      );
    },
    AppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppScreen(),
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoriesScreen(
          key: args.key,
          categories: args.categories,
        ),
      );
    },
    ChooseLanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseLanguageScreen(),
      );
    },
    ConfirmationOfSaleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmationOfSaleScreen(),
      );
    },
    ConversationRoute.name: (routeData) {
      final args = routeData.argsAs<ConversationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConversationScreen(
          key: args.key,
          chatId: args.chatId,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          email: args.email,
          password: args.password,
        ),
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
      final args = routeData.argsAs<ProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductScreen(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProductStatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductStatsScreen(),
      );
    },
    ProhibitedPersonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProhibitedPersonsScreen(),
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
    SellerProfileRoute.name: (routeData) {
      final args = routeData.argsAs<SellerProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SellerProfileScreen(
          key: args.key,
          sellerId: args.sellerId,
        ),
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
    StatisticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticsScreen(),
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
          category: args.category,
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
/// [AccountVerificationScreen]
class AccountVerificationRoute extends PageRouteInfo<void> {
  const AccountVerificationRoute({List<PageRouteInfo>? children})
      : super(
          AccountVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddYourProductScreen]
class AddYourProductRoute extends PageRouteInfo<AddYourProductRouteArgs> {
  AddYourProductRoute({
    Key? key,
    required Category category,
    List<PageRouteInfo>? children,
  }) : super(
          AddYourProductRoute.name,
          args: AddYourProductRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'AddYourProductRoute';

  static const PageInfo<AddYourProductRouteArgs> page =
      PageInfo<AddYourProductRouteArgs>(name);
}

class AddYourProductRouteArgs {
  const AddYourProductRouteArgs({
    this.key,
    required this.category,
  });

  final Key? key;

  final Category category;

  @override
  String toString() {
    return 'AddYourProductRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [AdvertisingScreen]
class AdvertisingRoute extends PageRouteInfo<void> {
  const AdvertisingRoute({List<PageRouteInfo>? children})
      : super(
          AdvertisingRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvertisingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllDepartmentsScreen]
class AllDepartmentsRoute extends PageRouteInfo<AllDepartmentsRouteArgs> {
  AllDepartmentsRoute({
    Key? key,
    required HomeCubit homeCubit,
    List<PageRouteInfo>? children,
  }) : super(
          AllDepartmentsRoute.name,
          args: AllDepartmentsRouteArgs(
            key: key,
            homeCubit: homeCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'AllDepartmentsRoute';

  static const PageInfo<AllDepartmentsRouteArgs> page =
      PageInfo<AllDepartmentsRouteArgs>(name);
}

class AllDepartmentsRouteArgs {
  const AllDepartmentsRouteArgs({
    this.key,
    required this.homeCubit,
  });

  final Key? key;

  final HomeCubit homeCubit;

  @override
  String toString() {
    return 'AllDepartmentsRouteArgs{key: $key, homeCubit: $homeCubit}';
  }
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
/// [CategoriesScreen]
class CategoriesRoute extends PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    Key? key,
    required List<Category> categories,
    List<PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(
            key: key,
            categories: categories,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<CategoriesRouteArgs> page =
      PageInfo<CategoriesRouteArgs>(name);
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({
    this.key,
    required this.categories,
  });

  final Key? key;

  final List<Category> categories;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, categories: $categories}';
  }
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
/// [ConfirmationOfSaleScreen]
class ConfirmationOfSaleRoute extends PageRouteInfo<void> {
  const ConfirmationOfSaleRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmationOfSaleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmationOfSaleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConversationScreen]
class ConversationRoute extends PageRouteInfo<ConversationRouteArgs> {
  ConversationRoute({
    Key? key,
    required String chatId,
    List<PageRouteInfo>? children,
  }) : super(
          ConversationRoute.name,
          args: ConversationRouteArgs(
            key: key,
            chatId: chatId,
          ),
          initialChildren: children,
        );

  static const String name = 'ConversationRoute';

  static const PageInfo<ConversationRouteArgs> page =
      PageInfo<ConversationRouteArgs>(name);
}

class ConversationRouteArgs {
  const ConversationRouteArgs({
    this.key,
    required this.chatId,
  });

  final Key? key;

  final String chatId;

  @override
  String toString() {
    return 'ConversationRouteArgs{key: $key, chatId: $chatId}';
  }
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

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
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    String? email,
    String? password,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            email: email,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.email,
    this.password,
  });

  final Key? key;

  final String? email;

  final String? password;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, email: $email, password: $password}';
  }
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
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<ProductRouteArgs> page =
      PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [ProductStatsScreen]
class ProductStatsRoute extends PageRouteInfo<void> {
  const ProductStatsRoute({List<PageRouteInfo>? children})
      : super(
          ProductStatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductStatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProhibitedPersonsScreen]
class ProhibitedPersonsRoute extends PageRouteInfo<void> {
  const ProhibitedPersonsRoute({List<PageRouteInfo>? children})
      : super(
          ProhibitedPersonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProhibitedPersonsRoute';

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
/// [SellerProfileScreen]
class SellerProfileRoute extends PageRouteInfo<SellerProfileRouteArgs> {
  SellerProfileRoute({
    Key? key,
    required String sellerId,
    List<PageRouteInfo>? children,
  }) : super(
          SellerProfileRoute.name,
          args: SellerProfileRouteArgs(
            key: key,
            sellerId: sellerId,
          ),
          initialChildren: children,
        );

  static const String name = 'SellerProfileRoute';

  static const PageInfo<SellerProfileRouteArgs> page =
      PageInfo<SellerProfileRouteArgs>(name);
}

class SellerProfileRouteArgs {
  const SellerProfileRouteArgs({
    this.key,
    required this.sellerId,
  });

  final Key? key;

  final String sellerId;

  @override
  String toString() {
    return 'SellerProfileRouteArgs{key: $key, sellerId: $sellerId}';
  }
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
/// [StatisticsScreen]
class StatisticsRoute extends PageRouteInfo<void> {
  const StatisticsRoute({List<PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

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
    required Category category,
    List<PageRouteInfo>? children,
  }) : super(
          ViewProductSectionRoute.name,
          args: ViewProductSectionRouteArgs(
            key: key,
            isRealEstate: isRealEstate,
            category: category,
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
    required this.category,
  });

  final Key? key;

  final bool isRealEstate;

  final Category category;

  @override
  String toString() {
    return 'ViewProductSectionRouteArgs{key: $key, isRealEstate: $isRealEstate, category: $category}';
  }
}
