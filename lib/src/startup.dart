import 'package:derma_scan/src/services/base_service.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/shared_preferences.dart';

final singleton = GetIt.instance;
//
Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  singleton.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(prefs: _prefs),
  );
  singleton.registerSingleton<DioClient>(DioClient());

}
