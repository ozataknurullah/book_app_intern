import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/routes/app_router.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constant/app_strings.dart';
import '../../domain/enum/auth_status.dart';
import '../providers/auth_provider.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthStatus>(authProvider, (previous, next) {
      if (next == AuthStatus.authenticated) {
        context.pushRoute(const HomeRoute());
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).checkAuthStatus();
    });

    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.primary,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 10.h, top: 10.h, right: 15.w, left: 15.w),
        child: Column(
          children: [
            const _CenterLogo(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Button
                  const _LoginButton(),
                  SizedBox(height: 10.h),
                  // Skip Button
                  const _SkipTextButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkipTextButton extends StatelessWidget {
  const _SkipTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushRoute(LoginRoute());
      },
      child: const Text(AppStrings.skip),
    );
  }
}

class _CenterLogo extends StatelessWidget {
  const _CenterLogo();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Hero(
        tag: 'mayLogo',
        child: Center(
          child: SvgPicture.asset(
            AppAssets.logo,
            height: 130.sp,
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.pushRoute(LoginRoute());
        },
        child: const Text(AppStrings.login),
      ),
    );
  }
}
