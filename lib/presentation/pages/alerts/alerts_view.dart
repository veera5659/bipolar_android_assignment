import 'package:flutter/material.dart';

import '../../../app/functions.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_list_view.dart';
import '../../../presentation/widgets/custom_tab_bar.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTabBar(
            onTapCallback: emptyVoidCallback,
          ),
          const SizedBox(
            height: AppSizes.s14,
          ),
          CustomListView(
            keyList: AppListConstants.alertsKeyList,
            valueList: AppListConstants.alertsValueList,
            highlightHeaderAlone: false,
          ),
        ],
      ),
    );
  }
}
