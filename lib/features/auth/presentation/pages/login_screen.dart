import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/auth/presentation/providers/login_provider.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/custom_toast.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final loginState = ref.watch(loginNotifierProvider);
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    final rememberMe = ref.watch(rememberMeProvider);

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
              const _Logo(),
              SizedBox(height: 100.h),
              const _HeadText(),
              SizedBox(height: 60.h),
              CustomTextField(
                controller: emailController,
                hintText: AppStrings.emailHint,
                label: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: AppStrings.password,
                hintText: AppStrings.passwordHint,
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 16.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _RememberMeSection(),
                  _RegisterTextButton(),
                ],
              ),
              SizedBox(height: 130.h),
              _LoginButton(
                loginNotifier: loginNotifier,
                passwordController: passwordController,
                emailController: emailController,
                rememberMe: rememberMe,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterTextButton extends StatelessWidget {
  const _RegisterTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushRoute(RegisterRoute());
      },
      child: const Text(AppStrings.register),
    );
  }
}

class _RememberMeSection extends ConsumerWidget {
  const _RememberMeSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rememberMe = ref.watch(rememberMeProvider);
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) async {
            ref.read(rememberMeProvider.notifier).state = value!;
          },
        ),
        Text(
          AppStrings.rememberMe,
          style: AppTheme.lightTheme.textTheme.headlineLarge?.copyWith(
            color: AppTheme.lightTheme.colorScheme.secondary,
          ),
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
          AppStrings.loginAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'mayLogo',
      child: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          height: 65.sp,
        ),
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton({
    required this.loginNotifier,
    required this.emailController,
    required this.passwordController,
    required this.rememberMe,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginNotifier loginNotifier;
  final bool rememberMe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final emailError = Validators.validateEmail(emailController.text);
          if (emailError != null) {
            CustomToast.showError(emailError);
            return;
          }

          // Validate password
          final passwordError =
              Validators.validatePassword(passwordController.text);
          if (passwordError != null) {
            CustomToast.showError(passwordError);
            return;
          }

          // Show loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Giriş Yapılıyor..."),
                ],
              ),
            ),
          );

          try {
            // Login process
            await ref.read(loginNotifierProvider.notifier).login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  rememberMe,
                );

            // Success status
            if (ref.read(loginNotifierProvider).errorMessage == null) {
              if (context.mounted) {
                Navigator.of(context).pop();
                context.router.replace(const HomeRoute());
              }
            } else {
              // Error status
              if (context.mounted) {
                Navigator.of(context).pop();
                CustomToast.showError('Giriş bilgilerinizi kontrol ediniz');
              }
            }
          } catch (e) {
            throw Exception(e);
          }
        },
        child: const Text(AppStrings.login),
      ),
    );
  }
}
