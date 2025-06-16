

import 'package:derma_scan/src/bottom_navigation/bottom_navigation.dart';
import 'package:derma_scan/src/modules/scan/take_picture_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../splash_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen()); 
    case '/takePictureScreen':
      return MaterialPageRoute(builder: (_) => TakePictureScreen());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
