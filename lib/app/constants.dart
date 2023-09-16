import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static double homeProductsHeight = 190.h;
  static const Duration apiTimeOut = Duration(seconds: 60);
  static const String chatCheersSwitchKey = 'chatCheersSwitchKey';
  static const String statisticsAlertsSwitchKey = 'statisticsAlertsSwitchKey';
  static const String alertsAddToFavoritesSwitchKey =
      'alertsAddToFavoritesSwitchKey';
  static const String messageAlertsSwitchKey = 'messageAlertsSwitchKey';
  static const String seePhoneNumberSwitchKey = 'seePhoneNumberSwitchKey';
  static const String categoryImagePath = '${baseUrl}cdn/categories/';
  static const String productImagePath = '${baseUrl}cdn/products/';
  static const String baseUrl = 'https://node.delalty.com/';
  static const String registerPath = 'auth/register';
  static const String loginPath = 'auth/login';
  static const String facebookLoginPath = 'auth/facebook/redirect';
  static const String googleLoginPath = 'auth/google/redirect';
  static const String appleLoginPath = 'auth/apple/redirect';
  static const String verifyPhonePath = 'auth/verify-phone';
  static const String getCategoryPath = 'categories/{id}';
  static const String getCategoriesPath = 'categories';
  static const String getBestCategoriesPath = 'categories/popular';
  static const String createProductPath = 'products/';
  static const String addProductToFavoritesPath = 'favorites/{product_id}';
  static const String getFavoritesPath = 'favorites';
  static const String getUserDataPath = 'users/{id}';
  static const String getProductForCategoryPath = 'search';
  static const String removeProductFromFavoritesPath = 'favorites/{product_id}';
  static const String getProductPath = 'products/{id}';
  static const String getProductSingleCommentPath =
      'products/{product_id}/comments/{id}';
  static const String getProductCommentsPath = 'products/{product_id}/comments';
}
