import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/constant/app_strings.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_text_field.dart';
import 'package:book_app_intern_project/features/auth/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerNotifierProvider);
    final registerNotifier = ref.read(registerNotifierProvider.notifier);

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
              CustomTextField(
                  label: AppStrings.name,
                  hintText: AppStrings.nameHint,
                  controller: nameController),
              SizedBox(height: 20.h),
              CustomTextField(
                label: AppStrings.email,
                hintText: AppStrings.emailHint,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: AppStrings.password,
                hintText: AppStrings.passwordHint,
                controller: passwordController,
                obscureText: true,
              ),
              const _LoginTextButton(),
              SizedBox(height: 35.h),
              registerState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _RegisterButton(
                      registerNotifier: registerNotifier,
                      emailController: emailController,
                      nameController: nameController,
                      passwordController: passwordController,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  //
}

class _RegisterButton extends StatelessWidget {
  final RegisterNotifier registerNotifier;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _RegisterButton(
      {required this.registerNotifier,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          registerNotifier.register(
            nameController.text,
            emailController.text,
            passwordController.text,
          );
        },
        child: const Text(AppStrings.register),
      ),
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            context.router.maybePop();
          },
          child: const Text(AppStrings.login),
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
          AppStrings.welcomeBack,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.registerAccount,
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
