import 'package:get/get.dart';

import '../../presentation/pages/unknown/unknown_view.dart';
import '../../presentation/pages/main/main_view.dart';
import '../../presentation/pages/splash/splash_view.dart';

class Routes {
  /// SPLASH
  static const String splashRoute = '/';

  /// HOME
  static const String homeRoute = '/home';

  /// UNKNOWN
  static const String unknownRoute = '/notFound';
}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages = [
    /// SPLASH
    GetPage(name: Routes.splashRoute, page: () => const SplashView()),

    /// MAIN
    GetPage(name: Routes.homeRoute, page: () => const MainView()),
  ];

  /// UNKNOWN
  static GetPage<dynamic> unknownRoute = GetPage(
    name: Routes.unknownRoute,
    page: () => const UnknownView(),
  );
}
