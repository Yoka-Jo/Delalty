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
  static const String baseUrl = 'https://laravel.delalty.com/api/';
  static const String registerPath = 'auth/register';
  static const String loginPath = 'auth/login';
  static const String facebookLoginPath = 'auth/facebook/redirect';
  static const String googleLoginPath = 'auth/google/redirect';
  static const String appleLoginPath = 'auth/apple/redirect';
  static const String verifyPhonePath = 'auth/verify-phone';
  static const String getCategoryPath = 'categories/{id}';
}
