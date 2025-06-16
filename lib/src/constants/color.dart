import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color primary = hexToColor('#00796B');
  static Color primaryVariant = hexToColor('#00796B');
  static Color secondary = hexToColor('#FFD54F');
  static Color background = hexToColor('#FAFAFA');
  static Color surface = hexToColor('#FFFFFF');
  static Color error = hexToColor('#E57373');
  static Color textPrimary = hexToColor('#212121');
  static Color textSecondary = hexToColor('#757575');
}
