import 'package:flutter/services.dart';

class MethodHelper{
  static const MethodChannel _channel = MethodChannel('camera_utils');

  static Future<double?> getFocalLength() async {
    try {
      final double focalLength = await _channel.invokeMethod('getFocalLength');
      return focalLength;
    } catch (e) {
      print("Failed to get focal length: $e");
      return null;
    }
  }
  static Future<double?> getSensorWidth() async {
    try {
      final sensorWidth = await _channel.invokeMethod<double>("getSensorWidth");
      return sensorWidth;
    } catch (e) {
      print("Failed to get sensor width: $e");
      return null;
    }
  }

}

