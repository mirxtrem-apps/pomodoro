import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/common/theme/app_colors.dart';

abstract class AppTheme {

  static final String? _defaultFont = GoogleFonts.teko().fontFamily;

  static ThemeData dark() {
    return ThemeData(
        fontFamily: _defaultFont,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.card,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStatePropertyAll(AppColors.text),
          trackColor: MaterialStatePropertyAll(AppColors.accent),
          trackOutlineColor: MaterialStatePropertyAll(AppColors.text),
          trackOutlineWidth: const MaterialStatePropertyAll(2),
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            color: AppColors.text,
            fontSize: 20.0,
            fontFamily: _defaultFont
          ),
        ),
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
        fontFamily: _defaultFont,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.cardLight,
        ),
        switchTheme: SwitchThemeData(
            thumbColor: MaterialStatePropertyAll(AppColors.accent),
            trackColor: MaterialStatePropertyAll(AppColors.card),
            trackOutlineColor: MaterialStatePropertyAll(AppColors.text),
            trackOutlineWidth: const MaterialStatePropertyAll(2)),
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            color: AppColors.dark,
            fontSize: 20.0,
            fontFamily: _defaultFont
          ),
        ),
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
