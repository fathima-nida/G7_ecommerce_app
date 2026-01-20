import 'dart:developer';
import 'package:g7_comerce_app/core/constants/pref_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static Future<void> setString(String key, String value) async {
    log("📌 LOCAL STORAGE SAVED: $key = $value");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    log("📌 LOCAL STORAGE SAVED: $key = $value");
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getString(key);
    log("📌 LOCAL STORAGE READ: $key = $val");
    return val;
  }

  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }



}
