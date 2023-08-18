import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:employee_assignment/utils/is_larger_device.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.primary,
      size: AppHeight.h18,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarHeight: toolbarHeight(context),
      iconTheme: const IconThemeData(color: ColorManager.white),
      foregroundColor: ColorManager.white,
      backgroundColor: ColorManager.primary,
      titleTextStyle: TextStyle(
        fontSize: FontSize.s18,
        fontWeight: FontWeightManager.medium,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.r16),
          topRight: Radius.circular(AppBorderRadius.r16),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      elevation: 0,
      backgroundColor: ColorManager.white,
      surfaceTintColor: ColorManager.white,
      iconColor: ColorManager.arrow,
      actionsPadding: EdgeInsets.all(AppPadding.p14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r16),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: ColorManager.white,
      backgroundColor: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.all(AppPadding.p4_2),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.enabledBorder,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.primary,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      prefixIconColor: ColorManager.primary,
      suffixIconColor: ColorManager.primary,
      hintStyle: TextStyle(
        color: ColorManager.hintText,
        fontSize: FontSize.s16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r6),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p22,
          vertical: verticalPadding(context),
        ),
        foregroundColor: ColorManager.white,
        backgroundColor: ColorManager.primary,
        textStyle: TextStyle(
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r6),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p22,
          vertical: verticalPadding(context),
        ),
        foregroundColor: ColorManager.primary,
        backgroundColor: ColorManager.lightBlue,
        textStyle: TextStyle(
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: ColorManager.primary,
      contentTextStyle: TextStyle(
        fontSize: FontSize.s15,
      ),
    ),
  );
}
