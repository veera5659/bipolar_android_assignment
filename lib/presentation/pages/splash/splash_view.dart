import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/splash/splash_view_model.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/colors_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashViewModel());

    return CustomScaffold(
      context,
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(
          ImageAssets.splashLogo,
          width: AppSizes.s225,
          height: AppSizes.s125,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
