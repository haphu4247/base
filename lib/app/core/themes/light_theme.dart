import 'package:flutter/material.dart';

import '../fonts/app_fonts.dart';
import '../colors/app_colors.dart';

ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: AppFonts.Roboto.name,
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primaryColorDark,
  primaryColorLight: AppColors.primaryColorLight,
  primaryIconTheme: IconThemeData(color: AppColors.black),
  backgroundColor: AppColors.lightGrey,
  scaffoldBackgroundColor: AppColors.white,
  hoverColor: AppColors.hoverColor,
  splashColor: AppColors.splashColor,
  highlightColor: AppColors.highlightColor,
  indicatorColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: AppColors.primary,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.lightGrey,
    selectedLabelStyle: TextStyle(
      color: AppColors.transparent,
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      color: AppColors.transparent,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: _textTheme,
  primaryTextTheme: _primaryTextTheme,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.black,
  ),
);
const _textTheme = const TextTheme(
  headline1: const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  ),
  headline2: const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  ),
  headline3: const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  headline4: const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  headline5: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  headline6: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  ),
  subtitle1: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  subtitle2: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  ),
  bodyText1: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  bodyText2: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  button: TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  ),
  caption: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
  overline: const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  ),
);

const _primaryTextTheme = const TextTheme(
    headline1: const TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: AppColors.primary,
    ),
    headline2: const TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      color: AppColors.primary,
    ),
    headline3: const TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    headline4: const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    headline5: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    headline6: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    ),
    subtitle1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    subtitle2: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    ),
    bodyText1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    bodyText2: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    button: TextStyle(
      fontSize: 14,
      color: AppColors.primary,
      fontWeight: FontWeight.w400,
    ),
    caption: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ),
    overline: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
    ));
