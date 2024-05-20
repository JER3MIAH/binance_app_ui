import 'package:binance_app_ui/src/features/theme/data/colors.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';

final baseTheme = ThemeData.light();
const outlineInputBorderBase =
    UnderlineInputBorder(borderSide: BorderSide.none);

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
  ).apply(
    fontFamily: 'Satoshi',
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    background: appColors.ltBackground,
    outline: appColors.black,
    primary: appColors.white,
    secondary: appColors.ltgreyText,
  ),
);

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
  ).apply(
    fontFamily: 'Satoshi',
    bodyColor: appColors.black,
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: appColors.dtBackground,
    outline: appColors.white,
    primary: appColors.black,
    secondary: appColors.dtgreyText,
  ),
);

var appColors = AppColors();
