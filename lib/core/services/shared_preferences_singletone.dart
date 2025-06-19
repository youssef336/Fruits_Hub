import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _preferences?.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  static getString(String key) {
    return _preferences?.getString(key) ?? "";
  }

  static setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  static getInt(String key) {
    return _preferences?.getInt(key) ?? 0;
  }
}
