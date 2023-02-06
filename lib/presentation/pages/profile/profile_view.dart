import 'package:flutter/material.dart';

import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../presentation/widgets/custom_list_view.dart';
import '../../../presentation/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: AppSizes.s16,
          ),
          CustomHeaderText(AppStrings.companyAttendanceInformation),
          CustomListView(
            keyList: AppListConstants.profileKeyList1,
            valueList: AppListConstants.profileValueList1,
            editList: AppListConstants.profileEditList1,
          ),
          const SizedBox(
            height: AppSizes.s30,
          ),
          CustomListView(
            keyList: AppListConstants.profileKeyList2,
            valueList: AppListConstants.profileValueList2,
            editList: AppListConstants.profileEditList2,
          ),
        ],
      ),
    );
  }
}
