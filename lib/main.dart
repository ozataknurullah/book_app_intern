import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/login_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/register_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // app design size
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
