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
              const _CenterLogo(),
              SizedBox(height: 100.h),
              const _HeadText(),
              SizedBox(height: 60.h),
              _NameField(nameController: nameController),
              SizedBox(height: 20.h),
              _EmailField(emailController: emailController),
              SizedBox(height: 20.h),
              _PasswordField(passwordController: passwordController),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _LoginTextButton(),
                ],
              ),
              SizedBox(height: 35.h),
              const _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Register"),
      ),
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.maybePop();
      },
      child: const Text("Login"),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}

class _HeadText extends StatelessWidget {
  const _HeadText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back!",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8.h),
        Text(
          "Register an account",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _CenterLogo extends StatelessWidget {
  const _CenterLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppAssets.logo,
        height: 65.sp,
      ),
    );
  }
}
