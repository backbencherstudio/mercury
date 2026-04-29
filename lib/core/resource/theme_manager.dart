import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constansts/color_manger.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false, // set true if using Material 3
    // ===== Main colors =====
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.textSecondary,
    splashColor: ColorManager.primaryDark,
    scaffoldBackgroundColor: ColorManager.whiteColor,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.primaryDark,
      error: ColorManager.errorColor,
    ),

    // ===== Card Theme =====
    cardTheme: CardThemeData(
      color: ColorManager.whiteColor,
      shadowColor: ColorManager.subtitleText,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),

    // ===== AppBar Theme =====
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      iconTheme: IconThemeData(color: ColorManager.whiteColor),
      titleTextStyle: getSemiBold600Style12(
        color: ColorManager.whiteColor,
        fontSize: FontSize.s16,
      ),
    ),

    // ===== Button Theme =====
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.textSecondary,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryDark,
    ),

    // ===== Elevated Button Theme =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.whiteColor,
        textStyle: getRegular400Style12(
          color: ColorManager.whiteColor,
          fontSize: FontSize.s16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p12,
        ),
      ),
    ),

    // ===== Text Theme =====
    textTheme: TextTheme(
      headlineLarge: getSemiBold600Style12(
        color: ColorManager.blackColor,
        fontSize: FontSize.s20,
      ),
      titleMedium: getMedium500Style12(
        color: ColorManager.blackColor,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getRegular400Style12(
        color: ColorManager.blackColor,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegular400Style12(
        color: ColorManager.subtitleText,
        fontSize: FontSize.s12,
      ),
      labelLarge: getSemiBold600Style12(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
    ),

    // ===== Cursor & Selection Colors =====
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.primary,
      selectionColor: ColorManager.primary.withValues(alpha: 0.1),
      selectionHandleColor: ColorManager.primary,
    ),

    // ===== Input Field Theme =====
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.whiteColor,
      hintStyle: getRegular400Style12(color: ColorManager.black300),
      labelStyle: getMedium500Style12(color: ColorManager.blackColor),
      helperStyle: getRegular400Style12(color: ColorManager.blackColor),
      errorStyle: getRegular400Style12(color: ColorManager.errorColor),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.borderColor, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.backgroundColor, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.errorColor, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.errorColor, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),

    // ===== Icon Theme =====
    iconTheme: IconThemeData(color: ColorManager.primary, size: 24.r),
  );
}
