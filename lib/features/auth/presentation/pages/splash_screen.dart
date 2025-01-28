import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.primary,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 10.h, top: 10.h, right: 15.w, left: 15.w),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Hero(
                tag: 'mayLogo',
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/Logo.svg',
                    height: 130.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        AutoRouter.of(context).pushNamed('/login');
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  SizedBox(height: 10.h), // Butonlar arası boşluk
                  // Skip Butonu
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).pushNamed('/login');
                    },
                    child: const Text('Skip'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
