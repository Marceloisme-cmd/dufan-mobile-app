import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _keyName = 'name';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyIsLoggedIn = 'isLoggedIn';

  // REGISTER
  static Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);

    // auto login setelah register (opsional tapi UX lebih bagus)
    await prefs.setBool(_keyIsLoggedIn, true);
  }

  // LOGIN
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString(_keyEmail);
    final savedPassword = prefs.getString(_keyPassword);

    if (email == savedEmail && password == savedPassword) {
      await prefs.setBool(_keyIsLoggedIn, true);
      return true;
    }

    return false;
  }

  // LOGOUT
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyIsLoggedIn, false);
  }

  // CHECK SESSION
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // GET USER NAME (INI PENTING BUAT "KUMACHI DINAMIS")
  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  // GET EMAIL (opsional)
  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }
}
