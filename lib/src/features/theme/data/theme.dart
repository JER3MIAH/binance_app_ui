import 'package:binance_app_ui/src/features/theme/data/colors.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final baseTheme = ThemeData.light();
const outlineInputBorderBase =
    UnderlineInputBorder(borderSide: BorderSide.none);

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    headlineMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
    ),
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    outline: appColors.black,
    inversePrimary: appColors.white,
    primary: const Color(0xFF0088CC),
    primaryContainer: const Color(0xFF39A2DB),
    secondary: appColors.grey.withOpacity(0.3),
    error: appColors.error,
    background: appColors.white,
    onBackground: const Color(0xFFEEEEEE),
  ),
);

ThemeData darkTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    headlineMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
    ),
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    outline: appColors.white,
    inversePrimary: appColors.black,
    primary: const Color(0xFF1A2233),
    primaryContainer: const Color(0xFF39A2DB),
    background: const Color(0xFF212A3E),
    onBackground: const Color(0xFF2C3549),
    secondary: appColors.grey.withOpacity(0.3),
    error: appColors.error,
  ),
);

var appColors = AppColors();
