import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kPrefsIsLightTheme = "is_light_theme";
const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";

@injectable
class LocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalDataSource(this._sharedPreferences);

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
