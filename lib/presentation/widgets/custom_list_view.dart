import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/constants_manager.dart';
import '../../presentation/resources/fonts_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../../presentation/widgets/custom_text.dart';

class CustomListView extends StatelessWidget {
  final List<String> keyList, valueList;
  final bool highlightHeaderAlone;
  final String boldText;
  final List<bool> editList;
  final bool isImageAndHeaderVisible;
  final int screenItem;

  const CustomListView({
    super.key,
    required this.keyList,
    required this.valueList,
    this.highlightHeaderAlone = true,
    this.editList = const [],
    this.boldText = '',
    this.isImageAndHeaderVisible = false,
    this.screenItem = AppConstants.otherScreens,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.r5),
        ),
      ),
      child: Padding(
        padding: (screenItem == AppConstants.otherScreens)
            ? const EdgeInsets.all(AppPaddings.p10)
            : const EdgeInsets.only(bottom: AppPaddings.p10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (screenItem != AppConstants.otherScreens) _addHeader(),
            if (isImageAndHeaderVisible) _addImages(),
            for (int i = 0; i < keyList.length; i++) _listItem(i),
          ],
        ),
      ),
    );
  }

  Widget _addHeader() {
    return Container(
      color: ColorManager.listHeaderBackgroundColor,
      width: Get.size.width,
      height: AppSizes.s32_5,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: AppPaddings.p10),
      child: CustomText(
        screenItem == AppConstants.scanNewFaceAddedScreen
            ? AppStrings.newFaceAdded
            : AppStrings.faceFound,
      ),
    );
  }

  Widget _addImages() {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPaddings.p14, bottom: AppPaddings.p20, left: AppPaddings.p10),
      child: Row(
        children: [
          Image.asset(
            ImageAssets.scanBackgroundImage,
            height: AppSizes.s201,
            width: AppSizes.s102,
            fit: BoxFit.cover,
          ),
          if (screenItem == AppConstants.scanFaceFoundScreen)
            Padding(
              padding: const EdgeInsets.only(left: AppPaddings.p30),
              child: Image.asset(
                ImageAssets.scanFace2,
                height: AppSizes.s201,
                width: AppSizes.s102,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }

  Widget _listItem(int index) {
    return Container(
      height: AppSizes.s36,
      alignment: Alignment.center,
      margin: (screenItem != AppConstants.otherScreens)
          ? const EdgeInsets.only(left: AppPaddings.p10, right: AppPaddings.p10)
          : EdgeInsets.zero,
      color: (index == 0)
          ? ColorManager.listHeaderBackgroundColor
          : (((index % 2 == 0) && !highlightHeaderAlone)
              ? ColorManager.listAlternateBackgroundColor
              : ColorManager.backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p15),
        child: Row(
          children: [
            _rowItem(keyList[index],
                textAlign: ((valueList[index].isEmpty)
                    ? TextAlign.center
                    : TextAlign.start)),
            if (valueList[index].isNotEmpty)
              _rowItem(
                valueList[index],
                textAlign: TextAlign.end,
                isEditable: (editList.isNotEmpty &&
                    editList[index] &&
                    keyList[index] != AppStrings.company),
              ),
            if (editList.isNotEmpty && editList[index])
              Padding(
                padding: const EdgeInsets.only(left: AppPaddings.p20),
                child: Image.asset(
                  ImageAssets.edit,
                  width: AppSizes.s12,
                  height: AppSizes.s12,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(String text,
      {required TextAlign textAlign, bool? isEditable}) {
    return Expanded(
      child: CustomText(
        text,
        textStyle: (text == boldText)
            ? getListTextStyle(fontWeight: FontWeightManager.bold)
            : (isEditable != null && isEditable)
                ? getListTextStyle(textColor: ColorManager.textLabelColor)
                : getListTextStyle(),
        textAlign: textAlign,
      ),
    );
  }
}
