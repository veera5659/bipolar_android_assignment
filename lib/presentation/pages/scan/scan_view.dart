import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../app/functions.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/colors_manager.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/resources/styles_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_list_view.dart';
import '../../../presentation/widgets/custom_tab_bar.dart';
import '../../../presentation/widgets/custom_text.dart';

enum ScanResult {
  none,
  scanning,
  completed,
  newFaceAdded,
  faceFound,
}

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    var scanResult = ScanResult.none.obs;

    return Stack(
      children: [
        Obx(
          () {
            Widget widget = const SizedBox();

            if (scanResult.value != ScanResult.newFaceAdded &&
                scanResult.value != ScanResult.faceFound) {
              widget = Image.asset(
                ImageAssets.scanBackgroundImage,
                fit: BoxFit.cover,
                width: Get.size.width,
                height: Get.size.height,
              );
            }

            return widget;
          },
        ),
        Obx(() {
          Widget widget;

          if (scanResult.value == ScanResult.newFaceAdded ||
              scanResult.value == ScanResult.faceFound) {
            widget = SingleChildScrollView(
                child: _addLayoutWithoutScrollView(scanResult: scanResult));
          } else {
            widget = _addLayoutWithoutScrollView(scanResult: scanResult);
          }

          return widget;
        }),
      ],
    );
  }

  Widget _addLayoutWithoutScrollView({required Rx<ScanResult> scanResult}) {
    return Padding(
      padding: const EdgeInsets.all(AppPaddings.p24),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTabBar(
              onTapCallback: emptyVoidCallback,
            ),
            if (scanResult.value == ScanResult.none)
              _addButton(
                buttonIcon: ImageAssets.scanButtonImage,
                buttonText: AppStrings.scan,
                onPressed: () => scanResult.value = ScanResult.scanning,
              ),
            if (scanResult.value == ScanResult.scanning)
              _addProgressBar(onGetText: (double value) {
                if (value.toInt() == 100) {
                  Future.delayed(Duration.zero, () {
                    scanResult.value = ScanResult.completed;
                  });
                }

                return CustomText('${value.toInt()}%',
                    textStyle: getProgressTextStyle());
              }),
            if (scanResult.value == ScanResult.completed)
              _addButton(
                buttonIcon: ImageAssets.scanCompletedImage,
                buttonText: AppStrings.completed,
                onPressed: () => scanResult.value = ScanResult.newFaceAdded,
              ),
            if (scanResult.value == ScanResult.newFaceAdded)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPaddings.p30,
                ),
                child: CustomListView(
                  keyList: AppListConstants.scanKeyList1,
                  valueList: AppListConstants.scanValueList1,
                  isImageAndHeaderVisible: true,
                  screenItem: AppConstants.scanNewFaceAddedScreen,
                ),
              ),
            if (scanResult.value == ScanResult.faceFound)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPaddings.p30,
                ),
                child: CustomListView(
                  keyList: AppListConstants.scanKeyList2,
                  valueList: AppListConstants.scanValueList2,
                  isImageAndHeaderVisible: true,
                  screenItem: AppConstants.scanFaceFoundScreen,
                ),
              ),
            if (scanResult.value == ScanResult.newFaceAdded ||
                scanResult.value == ScanResult.faceFound)
              Obx(
                () => CustomTabBar(
                  isIconVisible: true,
                  tabTitleList: (scanResult.value == ScanResult.newFaceAdded)
                      ? AppListConstants.scanNewFaceButtonTextList
                      : AppListConstants.scanFaceFoundButtonTextList,
                  gradientColor: (scanResult.value == ScanResult.newFaceAdded)
                      ? <Color>[
                          ColorManager.scanVerifyButtonGradientStartColor,
                          ColorManager.scanVerifyButtonGradientEndColor,
                        ]
                      : <Color>[
                          ColorManager.scanFlagIssueGradientStartColor,
                          ColorManager.scanFlagIssueGradientEndColor,
                        ],
                  screenItem: (scanResult.value == ScanResult.newFaceAdded)
                      ? AppConstants.scanNewFaceAddedScreen
                      : AppConstants.scanFaceFoundScreen,
                  onTapCallback: (index) {
                    scanResult.value =
                        (scanResult.value == ScanResult.newFaceAdded &&
                                index == 0)
                            ? ScanResult.faceFound
                            : ScanResult.none;
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _addButton({
    required String buttonIcon,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPaddings.p30),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(buttonIcon),
        label: Padding(
          padding: const EdgeInsets.only(left: AppPaddings.p4),
          child: CustomText(
            buttonText,
            textStyle: getHeaderTextStyle(),
          ),
        ),
      ),
    );
  }

  Widget _addProgressBar({required Text Function(double) onGetText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPaddings.p30),
      child: SimpleCircularProgressBar(
        backStrokeWidth: AppSizes.sZero,
        progressColors: const [ColorManager.progressColor],
        progressStrokeWidth: AppBorders.b3,
        mergeMode: true,
        size: AppSizes.s84,
        animationDuration: 1,
        onGetText: onGetText,
      ),
    );
  }
}
