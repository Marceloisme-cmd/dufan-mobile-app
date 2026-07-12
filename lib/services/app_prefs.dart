import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static const _firstTimeKey = 'first_time';

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  static Future<void> setNotFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
  }
}
