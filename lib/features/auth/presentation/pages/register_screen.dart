import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 20.h, top: 10.h, right: 15.w, left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75.h),
              Center(
                child: SvgPicture.asset(
                  AppAssets.logo,
                  height: 65.sp,
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
              //Name field
              Text(
                "Name",
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                controller: nameController,
                hintText: "John Doe",
                obscureText: true,
              ),
              SizedBox(height: 20.h),
              //E-mail field
              Text(
                "E-Mail",
                style: Theme.of(context).textTheme.bodyMedium,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
