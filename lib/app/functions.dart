import 'package:get/get.dart';

import '../presentation/resources/constants_manager.dart';

showSnackBar(String title) {
  // Shows a snackbar for a second
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: 'Selected',
      duration: const Duration(seconds: AppConstants.snackBarDuration),
    ),
  );
}

emptyVoidCallback(int index) {}
