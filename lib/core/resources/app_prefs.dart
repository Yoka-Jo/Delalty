import 'package:shared_preferences/shared_preferences.dart';

const String kPrefsIsLightTheme = "is_light_theme";
const String kPrefsLang = "app_language";
const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";
const String kPrefsUserData = "userData";
const String kPrefsForgotPasswordData = "forgot_password_data";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<bool> saveIsOnBoardingScreenViewed() async {
    return await _sharedPreferences.setBool(
        kPrefsKeyIsOnBoardingScreenViewed, true);
  }

  bool getIsOnBoardingScreenViewed() {
    bool? isOnBoardingScreenViewed =
        _sharedPreferences.getBool(kPrefsKeyIsOnBoardingScreenViewed);
    if (isOnBoardingScreenViewed != null) {
      return isOnBoardingScreenViewed;
    } else {
      return false;
    }
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
