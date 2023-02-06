import 'package:flutter/material.dart';

import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/fonts_manager.dart';

/// App Theme
ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    fontFamily: FontConstants.fontPoppins,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          ColorManager.backgroundColor,
        ),
      ),
    ),
  );
}
