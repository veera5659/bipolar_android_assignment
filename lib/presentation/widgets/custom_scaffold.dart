import 'package:flutter/material.dart';

import '../../presentation/resources/values_manager.dart';

// ignore: non_constant_identifier_names
Widget CustomScaffold(BuildContext context,
    {required Widget body,
    double? scaffoldPadding,
    Color? backgroundColor,
    Widget? bottomNavigationBar}) {
  return SafeArea(
    child: Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding ?? AppPaddings.p24),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    ),
  );
}
