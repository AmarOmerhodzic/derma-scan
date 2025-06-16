
import 'package:derma_scan/src/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'helpers/route_helper.dart';
import 'routes/index.dart';

class App extends ConsumerStatefulWidget  {
  App({Key? key}) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  Locale? appLocale;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DermaScan',
      navigatorObservers: [RouteHelper.routeObserver],
      initialRoute: '/',
      onGenerateRoute: routes,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
