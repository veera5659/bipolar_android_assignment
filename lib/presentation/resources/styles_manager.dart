import 'package:flutter/material.dart';

import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/fonts_manager.dart';

/// Text Styles
TextStyle _getTextStyle({
  double fontSize = FontSizeManager.s16,
  FontWeight fontWeight = FontWeightManager.regular,
  Color textColor = ColorManager.textColor,
  String? fontFamily,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: textColor,
    fontFamily: fontFamily ?? FontConstants.fontPoppins,
  );
}

TextStyle getDefaultTextStyle() {
  return _getTextStyle();
}

TextStyle getBottomBarTextStyle({required bool isSelected}) {
  return _getTextStyle(
    textColor: isSelected
        ? ColorManager.bottomBarSelectedColor
        : ColorManager.bottomBarUnselectedColor,
    fontSize: FontSizeManager.s8,
    fontWeight: FontWeightManager.medium,
  );
}

TextStyle getHeaderTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s18,
    fontWeight: FontWeightManager.medium,
  );
}

TextStyle getListTextStyle(
    {FontWeight fontWeight = FontWeightManager.medium,
    Color textColor = ColorManager.textColor}) {
  return _getTextStyle(
    fontSize: FontSizeManager.s13,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontMontserrat,
    textColor: textColor,
  );
}

TextStyle getProgressTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s25,
    textColor: ColorManager.backgroundColor,
  );
}
