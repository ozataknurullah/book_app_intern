import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_theme.dart';
import 'text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.white,
        secondary: AppColors.secondary),
    textTheme: TextTheme(
      bodyLarge: bodyLargeData,
      bodyMedium: bodyMediumData,
      bodySmall: bodySmallData,
      headlineLarge: headlineLargeData,
      headlineMedium: headlineMediumData,
      headlineSmall: headlineSmallData,
      displayMedium: displayMediumData,
      displaySmall: displaySmallData,
    ),

    /// Elevated Button
    elevatedButtonTheme: _elevatedButtonThemeData(),

    /// Text Button
    textButtonTheme: _textButtonThemeData(),

    /// Checkbox
    checkboxTheme: _checkboxThemeData(),

    /// AppBar
    appBarTheme: _appBarTheme(),

    /// TextField
    inputDecorationTheme: _inputDecorationTheme(),
  );

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    );
  }

  static CheckboxThemeData _checkboxThemeData() {
    return CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.white),
      side: const BorderSide(
        color: AppColors.secondary,
        width: 2,
      ),
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.secondary,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: "Manrope",
        ),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 24.w,
        ),
        minimumSize: Size(100.w, 48.h),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Color.fromARGB(40, 0, 0, 0)),
    );
  }
}
