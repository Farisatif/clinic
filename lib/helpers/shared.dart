import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late SharedPreferences _instanced;

  static initalperf() async {
    _instanced = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _instanced.setString(key, value);
  }

  static getString(String key) {
    return _instanced.getString(key) ?? "Error in get string";
  }

  static setBool(String key, bool value) async {
    await _instanced.setBool(key, value);
  }

  static getBool(String key) {
    return _instanced.getBool(key)?? false;
  }

  static setInt(String key, int value) async {
    await _instanced.setInt(key, value);
  }

  static getInt(String key) {
    return _instanced.getInt(key) ?? 0;
  }

}
