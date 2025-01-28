import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF1D1D4E),
        surface: Color(0xFFFFFFFF),
        secondary: Color(0xFF6251DD)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Manrope",
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Manrope",
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
          fontSize: 16),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Manrope",
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      headlineMedium: TextStyle(
          color: Colors.black,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w600,
          fontSize: 12),
      headlineSmall: TextStyle(
          color: Colors.black,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
          fontSize: 10),
    ),

    /// Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
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
    ),

    /// Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF6251DD),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: "Manrope",
        ),
      ),
    ),

    /// Checkbox
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
      side: const BorderSide(
        color: Color(0xFF6251DD),
        width: 2,
      ),
    ),

    /// TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF4F4FF),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Color.fromARGB(40, 0, 0, 0)),
    ),
  );
}
