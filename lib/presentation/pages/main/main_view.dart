import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/pages/main/main_view_model.dart';
import '../../../presentation/resources/colors_manager.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/styles_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.put(MainViewModel());

    return Obx(
      () => CustomScaffold(
        context,
        scaffoldPadding:
            (homeViewModel.selectedIndex.value == 1) ? 0.0 : AppPaddings.p24,
        body: PageView(
          controller: homeViewModel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: AppListConstants.pages,
          onPageChanged: (index) {
            homeViewModel.selectedIndex.value = index;
          },
        ),
        bottomNavigationBar: Obx(
          () => Container(
            height: AppSizes.s76,
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p20),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorManager.bottomBarBackgroundColor,
                )
              ],
            ),
            child: BottomNavigationBar(
              items: [
                for (int i = 0; i < AppListConstants.pages.length; i++)
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: AppPaddings.p4),
                      child: Image.asset(
                        AppListConstants.pageImages[i],
                        color: (homeViewModel.selectedIndex.value == i)
                            ? ColorManager.bottomBarSelectedColor
                            : ColorManager.bottomBarUnselectedColor,
                      ),
                    ),
                    label: AppListConstants.pageTitles[i],
                  )
              ],
              selectedItemColor: ColorManager.bottomBarSelectedColor,
              unselectedItemColor: ColorManager.bottomBarUnselectedColor,
              selectedLabelStyle: getBottomBarTextStyle(isSelected: true),
              unselectedLabelStyle: getBottomBarTextStyle(isSelected: false),
              iconSize: AppSizes.s10,
              backgroundColor: ColorManager.bottomBarBackgroundColor,
              currentIndex: homeViewModel.selectedIndex.value,
              onTap: (index) => _jumpToPage(index, homeViewModel),
              type: BottomNavigationBarType.fixed,
              elevation: AppSizes.sZero,
            ),
          ),
        ),
      ),
    );
  }

  _jumpToPage(int index, MainViewModel homeViewModel) {
    if (homeViewModel.pageController.hasClients) {
      homeViewModel.pageController.jumpToPage(index);
    }
  }
}
