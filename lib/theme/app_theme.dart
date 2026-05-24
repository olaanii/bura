import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_delivery/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.yellow,
        brightness: Brightness.light,
        surface: AppColors.white,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.grey100,
      textTheme: GoogleFonts.interTightTextTheme(base.textTheme).apply(
        bodyColor: AppColors.black,
        displayColor: AppColors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
