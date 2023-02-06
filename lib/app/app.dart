import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/resources/route_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // named constructor

  static final MyApp _instance =
      MyApp._internal(); // single instance or singleton,

  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages,
      unknownRoute: RouteGenerator.unknownRoute,
      theme: getApplicationTheme(),
    );
  }
}
