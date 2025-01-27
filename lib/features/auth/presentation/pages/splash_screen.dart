import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.primary,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/Logo.svg',
                height: 130.sp,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login Button
                ElevatedButton(onPressed: () {}, child: const Text('Login')),
                SizedBox(height: 10.h), // Butonlar arası boşluk
                // Skip Butonu
                TextButton(onPressed: () {}, child: const Text('Skip'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
