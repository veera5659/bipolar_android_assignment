import 'package:flutter/material.dart';

import '../../app/functions.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/constants_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../../presentation/widgets/custom_text.dart';

class CustomTabBar extends StatelessWidget {
  final bool isIconVisible;
  final List<String> tabTitleList;
  final List<Color>? gradientColor;
  final int screenItem;
  final Function(int) onTapCallback;

  const CustomTabBar({
    super.key,
    this.isIconVisible = false,
    this.tabTitleList = AppListConstants.tabTitles,
    this.gradientColor,
    this.screenItem = AppConstants.otherScreens,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPaddings.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < tabTitleList.length; i++)
            _tabItem(tabTitleList[i], i),
        ],
      ),
    );
  }

  Widget _tabItem(
    String tabText,
    int index,
  ) {
    BorderSide borderSide = const BorderSide(
      color: ColorManager.tabBarBorderColor,
      width: AppBorders.b2,
    );
    Border border = Border(
      top: borderSide,
      bottom: borderSide,
      right: borderSide,
      left: (index == 0) ? borderSide : BorderSide.none,
    );

    /// Set border radius only to the left and right corner
    // BorderRadius borderRadius = BorderRadius.zero;
    // Radius radius = const Radius.circular(AppRadius.r5);
    // if (index == 0) {
    //   borderRadius = BorderRadius.only(topLeft: radius, bottomLeft: radius);
    // } else if (index == (AppListConstants.tabTitles.length - 1)) {
    //   borderRadius = BorderRadius.only(topRight: radius, bottomRight: radius);
    // }

    return Expanded(
      child: InkWell(
        onTap: () {
          if (screenItem == AppConstants.otherScreens) {
            showSnackBar(tabText);
          }
          onTapCallback(index);
        },
        child: Container(
          height: AppSizes.s62,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            //borderRadius: borderRadius, // border radius can be used if needed
            gradient: LinearGradient(
              colors: (index == 0 && gradientColor != null)
                  ? gradientColor!
                  : <Color>[
                      ColorManager.tabBarGradientStartColor,
                      ColorManager.tabBarGradientEndColor,
                    ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isIconVisible)
                Padding(
                  padding: const EdgeInsets.only(right: AppPaddings.p10),
                  child: Image.asset(
                    (index == 0)
                        ? ImageAssets.scanVerify
                        : ImageAssets.scanCancel,
                    width: AppSizes.s18,
                    height: AppSizes.s18,
                  ),
                ),
              CustomText(
                tabText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
