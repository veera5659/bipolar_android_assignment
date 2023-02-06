import 'package:flutter/material.dart';

import '../../../app/functions.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_list_view.dart';
import '../../../presentation/widgets/custom_tab_bar.dart';
import '../../../presentation/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTabBar(onTapCallback: emptyVoidCallback),
          const SizedBox(
            height: AppSizes.s14,
          ),
          CustomHeaderText(AppStrings.faceRecognitionAssignment),
          CustomListView(
            keyList: AppListConstants.homeKeyList1,
            valueList: AppListConstants.homeValueList1,
          ),
          const SizedBox(
            height: AppSizes.s30,
          ),
          CustomListView(
            keyList: AppListConstants.homeKeyList2,
            valueList: AppListConstants.homeValueList2,
            boldText:
                AppListConstants.homeValueList2[AppConstants.boldTextIndex],
          ),
        ],
      ),
    );
  }
}
