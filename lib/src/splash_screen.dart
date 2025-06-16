import 'package:derma_scan/src/bottom_navigation/bottom_navigation.dart';
import 'package:derma_scan/src/data/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/color.dart';
import 'constants/image.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> with RouteAware {
  bool? executed;
  @override
  void initState() {
    super.initState();
    initializeApp();
  }


  Future<void> initializeApp() async {
    await DBHelper().ensureTablesExist();
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      body: Center(child: Image.asset(AllImages().logo)),
    );
  }
}
