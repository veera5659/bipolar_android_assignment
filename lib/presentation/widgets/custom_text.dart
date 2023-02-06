import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

// ignore: non_constant_identifier_names
Text CustomText(String text, {TextStyle? textStyle, TextAlign? textAlign}) {
  return Text(
    text,
    style: textStyle ?? getDefaultTextStyle(),
    textAlign: textAlign ?? TextAlign.start,
  );
}

// ignore: non_constant_identifier_names
Widget CustomHeaderText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: AppPaddings.p30),
    child: Container(
      width: Get.size.width,
      //height: AppSizes.s100,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: ColorManager.backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.r5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.p18),
        child: CustomText(
          text,
          textStyle: getHeaderTextStyle(),
        ),
      ),
    ),
  );
}
