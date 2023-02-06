import 'package:get/get.dart';

import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/route_manager.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    _moveToHomeScreen();
    super.onInit();
  }

  void _moveToHomeScreen() async {
    await Future.delayed(
      const Duration(seconds: AppConstants.splashDelayseconds),
      () {
        Get.offNamed(Routes.homeRoute);
      },
    );
  }
}
