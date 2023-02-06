import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/resources/constants_manager.dart';

class MainViewModel extends GetxController {
  var selectedIndex = AppConstants.defaultHomeBottomBarIndex.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: selectedIndex.value,
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
