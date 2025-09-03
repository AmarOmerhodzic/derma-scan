import 'package:derma_scan/src/bottom_navigation/bottom_navigation.dart';
import 'package:derma_scan/src/data/db/db_helper.dart';
import 'package:derma_scan/src/data/models/request/user_request_model.dart';
import 'package:derma_scan/src/helpers/shared_preferences.dart';
import 'package:derma_scan/src/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

import 'constants/color.dart';
import 'constants/image.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> with RouteAware {
  bool? executed;
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    //await DBHelper().ensureTablesExist();
    String? deviceId = await SharedPreferencesHelper.getDeviceId();

    if (deviceId == null) {
      deviceId = await _getDeviceId();
      await SharedPreferencesHelper.saveDeviceId(deviceId);
    }
    var model = UserRequest(id: deviceId);

    await UserService().createKorisnik(model);

    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<String> _getDeviceId() async {
    final deviceInfo = await _mobileDeviceIdentifierPlugin.getDeviceId();

    return deviceInfo ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      body: Center(child: Image.asset(AllImages().logo)),
    );
  }
}
