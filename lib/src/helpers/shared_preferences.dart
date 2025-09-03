
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';



class SharedPreferencesHelper {
  final SharedPreferences prefs;

  SharedPreferencesHelper({required this.prefs});

  static const String imagePathKey = 'saved_image_paths';

  static Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    final paths = prefs.getStringList(imagePathKey) ?? [];
    paths.add(path);
    await prefs.setStringList(imagePathKey, paths);
  }

  static Future<List<String>> getImagePaths() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(imagePathKey) ?? [];
  }

  static Future<void> clearImagePaths() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(imagePathKey);
  }

  static const String deviceIdKey = 'device_id';

  static Future<void> saveDeviceId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(deviceIdKey, id);
  }

  static Future<String?> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(deviceIdKey);
  }
}