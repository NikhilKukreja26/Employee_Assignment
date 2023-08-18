import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart'
    show BuildContext, MediaQuery, kToolbarHeight;

bool isTablet(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  if (screenWidth < 500) {
    return false;
  }
  return true;
}

double verticalPadding(BuildContext context) {
  return isTablet(context) ? AppPadding.p10 : AppPadding.p14;
}

double toolbarHeight(BuildContext context) {
  return isTablet(context) ? AppHeight.h50 : kToolbarHeight;
}
