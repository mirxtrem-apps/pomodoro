import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/common/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData dark() {
    return ThemeData(
        fontFamily: GoogleFonts.teko().fontFamily,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(AppColors.text),
        )),
        colorScheme: ColorScheme.dark(
          primary: AppColors.card,
          onPrimary: AppColors.text,
        ));
  }

  static ThemeData light() {
    return ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.teko().fontFamily,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(AppColors.card),
        )),
        colorScheme: ColorScheme.dark(
          primary: AppColors.cardLight,
          onPrimary: AppColors.card,
        ));
  }
}
