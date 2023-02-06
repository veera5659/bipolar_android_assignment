import 'package:flutter/material.dart';

import '../../presentation/pages/alerts/alerts_view.dart';
import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/profile/profile_view.dart';
import '../../presentation/pages/scan/scan_view.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/strings_manager.dart';

/// App Constants
class AppConstants {
  /// SPLASH
  static const int splashDelayseconds = 2;

  /// HOME
  static const int defaultHomeBottomBarIndex = 0;
  static const int boldTextIndex = 1;
  static const int alertListCount = 15;

  /// SCAN
  static const int otherScreens = 0;
  static const int scanNewFaceAddedScreen = 1;
  static const int scanFaceFoundScreen = 2;

  /// SNACKBAR
  static const int snackBarDuration = 1;
}

/// App Array List Constants
class AppListConstants {
  static List<Widget> pages = const [
    HomeView(),
    ScanView(),
    AlertsView(),
    ProfileView(),
  ];

  static List<String> pageImages = const [
    ImageAssets.home,
    ImageAssets.scan,
    ImageAssets.alerts,
    ImageAssets.profile,
  ];

  static List<String> pageTitles = const [
    AppStrings.home,
    AppStrings.scan,
    AppStrings.alerts,
    AppStrings.profile,
  ];

  static const List<String> tabTitles = [
    AppStrings.companyABC,
    AppStrings.hhmmss,
  ];

  static List<String> homeKeyList1 = const [
    AppStrings.state,
    AppStrings.district,
    AppStrings.zone,
  ];

  static List<String> homeValueList1 = const [
    AppStrings.tamilNadu,
    AppStrings.erode,
    AppStrings.capitalA,
  ];

  static List<String> homeKeyList2 = const [
    AppStrings.zoneA,
    AppStrings.attendance,
    AppStrings.visitors,
    AppStrings.totalEmployee,
  ];

  static List<String> homeValueList2 = const [
    AppStrings.users,
    AppStrings.attendanceCount,
    AppStrings.visitorsCount,
    AppStrings.totalEmployeeCount,
  ];

  static List<String> alertsKeyList = [
    AppStrings.alerts,
    for (int i = 0; i < AppConstants.alertListCount; i++) AppStrings.alert,
  ];

  static List<String> alertsValueList = [
    AppStrings.time,
    for (int i = 0; i < AppConstants.alertListCount; i++) AppStrings.hhmm,
  ];

  static List<String> profileKeyList1 = const [
    AppStrings.state,
    AppStrings.district,
    AppStrings.zone,
    AppStrings.company,
  ];

  static List<String> profileValueList1 = const [
    AppStrings.tamilNadu,
    AppStrings.erode,
    AppStrings.capitalA,
    AppStrings.companyName,
  ];

  static List<bool> profileEditList1 = const [
    false,
    false,
    false,
    true,
  ];

  static List<String> profileKeyList2 = const [
    AppStrings.securityHeadDetails,
    AppStrings.name,
    AppStrings.designation,
    AppStrings.email,
    AppStrings.number,
    AppStrings.username,
    AppStrings.password,
  ];

  static List<String> profileValueList2 = const [
    AppStrings.empty,
    AppStrings.nameValue,
    AppStrings.designationValue,
    AppStrings.emailValue,
    AppStrings.numberValue,
    AppStrings.usernameValue,
    AppStrings.passwordValue,
  ];

  static List<bool> profileEditList2 = [
    false,
    for (int i = 0; i < profileKeyList2.length - 1; i++) true,
  ];

  static const List<String> scanNewFaceButtonTextList = [
    AppStrings.verifyAndAdd,
    AppStrings.cancel,
  ];

  static const List<String> scanFaceFoundButtonTextList = [
    AppStrings.flagIssue,
    AppStrings.cancel,
  ];

  static List<String> scanKeyList1 = const [
    AppStrings.district,
    AppStrings.zone,
    AppStrings.totalEmployee,
    AppStrings.totalVisitors,
    AppStrings.time,
  ];

  static List<String> scanValueList1 = const [
    AppStrings.erode,
    AppStrings.capitalA,
    AppStrings.totalEmployeeCount,
    AppStrings.totalVisitorsCount,
    AppStrings.hhmmss,
  ];

  static List<String> scanKeyList2 = const [
    AppStrings.district,
    AppStrings.zone,
    AppStrings.timeReported,
    AppStrings.zone2,
    AppStrings.timeReported,
  ];

  static List<String> scanValueList2 = const [
    AppStrings.erodeEast,
    AppStrings.capitalA,
    AppStrings.hhmmss,
    AppStrings.capitalB,
    AppStrings.hhmmss,
  ];
}
