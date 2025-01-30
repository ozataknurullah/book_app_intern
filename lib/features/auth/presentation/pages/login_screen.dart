import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes/app_router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 10.h, top: 10.h, right: 15.w, left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75.h),
              Hero(
                tag: 'mayLogo',
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.logo,
                    height: 65.sp,
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 60.h),
              Text(
                "E-Mail",
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
              SizedBox(height: 5.h),
              // E-mail TextField
              CustomTextField(
                controller: emailController,
                hintText: "jhon@gmail.com",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              // Password TextField
              Text(
                "Password",
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        "Remember Me",
                        style: AppTheme.lightTheme.textTheme.headlineLarge
                            ?.copyWith(
                          color: AppTheme.lightTheme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushRoute(RegisterRoute());
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
              SizedBox(height: 130.h),
              const _LoginButton(),
            ],
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
          context.pushRoute(const HomeRoute());
        },
        child: const Text("Login"),
      ),
    );
  }
}
