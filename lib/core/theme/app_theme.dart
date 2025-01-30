import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF1D1D4E),
        surface: Color(0xFFFFFFFF),
        secondary: Color(0xFF6251DD)),
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
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  static CheckboxThemeData _checkboxThemeData() {
    return CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      side: const BorderSide(
        color: Color(0xFF6251DD),
        width: 2,
      ),
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF6251DD),
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
        backgroundColor: const Color(0xFFEF6B4A), // Buton arka plan rengi
        foregroundColor: Colors.white, // Yazı rengi
        textStyle: const TextStyle(
          fontSize: 16, // Yazı boyutu
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r), // Buton köşe yuvarlatma
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.h, // Dikey boşluk
          horizontal: 32.w, // Yatay boşluk
        ),
        minimumSize: Size(100.w, 48.h), // Butonun minimum boyutları
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF4F4FF),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Color.fromARGB(40, 0, 0, 0)),
    );
  }
}
