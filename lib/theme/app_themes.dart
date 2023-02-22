import 'package:flutter/material.dart';
import 'package:todo/assets/fonts/fonts.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

const String defaultFontFamily = Fonts.poppins;

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.primary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.secondary,
          error: AppColors.error,
          onError: AppColors.error,
          background: AppColors.backgroundColor,
          onBackground: AppColors.backgroundColor,
          surface: AppColors.backgroundColor,
          onSurface: AppColors.backgroundColor),
      fontFamily: defaultFontFamily,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH1,
          color: AppColors.headlineTextColor,
        ),
        // headline1
        displayMedium: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH2,
          color: AppColors.headlineTextColor,
        ),
        // headline2
        displaySmall: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH3,
          color: AppColors.headlineTextColor,
        ),
        // headline3
        headlineMedium: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH4,
          color: AppColors.headlineTextColor,
        ),
        // headline4
        headlineSmall: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH5,
          color: AppColors.headlineTextColor,
        ),
        // headline5
        titleLarge: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: AppDimens.fsH6,
          color: AppColors.headlineTextColor,
        ),
        // headline6
        bodyLarge: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppDimens.fsBT1,
          color: AppColors.bodyTextColor,
        ),
        // bodyText1
        bodyMedium: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppDimens.fsBT2,
          color: AppColors.bodyTextColor,
        ),
        // bodyText2
        titleMedium: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: AppDimens.fsST1,
          color: AppColors.bodyTextColor,
        ),
        // subTitle1
        titleSmall: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: AppDimens.fsST2,
          color: AppColors.bodyTextColor,
        ),
        // subTitle2
        labelLarge: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppDimens.fsBT,
          color: AppColors.white,
        ), // button
      ));
}
