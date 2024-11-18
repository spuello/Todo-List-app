import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData? appTheme() {
  final base = ThemeData(
    brightness: Brightness.light,
  );

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        elevation: 0.0,
        backgroundColor: AppColors.primary,
        minimumSize: Size(130, 56),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      fillColor: AppColors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grayACAFB5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: const BorderSide(color: AppColors.grayACAFB5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: const BorderSide(color: AppColors.grayACAFB5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
