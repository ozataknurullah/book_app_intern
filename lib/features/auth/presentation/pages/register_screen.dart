import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/auth/presentation/widgets/custom_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../states/register_state.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../providers/register_provider.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _RegisterButton(
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

class _RegisterButton extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _RegisterButton({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.read(registerNotifierProvider.notifier);
    final overlay = OverlayEntry(
      builder: (context) => const CustomOverlay(
        msg: AppStrings.registerInText,
      ),
    );

    ref.listen<RegisterState>(registerNotifierProvider, (previous, next) {
      if (!next.isLoading && next.errorMessage == null) {
        overlay.remove();
        CustomToast.showSuccess(AppStrings.registerSucces);
        context.router.maybePop();
      } else if (next.errorMessage != null) {
        overlay.remove();
        CustomToast.showError(AppStrings.registerError);
      }
    });
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (!_validateInputs(context)) return;
          Overlay.of(context).insert(overlay);

          // start the regisster process
          registerNotifier.register(
            nameController.text.trim(),
            emailController.text.trim(),
            passwordController.text.trim(),
          );
        },
        child: const Text(AppStrings.register),
      ),
    );
  }

  bool _validateInputs(BuildContext context) {
    // Name Validation
    final nameError = Validators.validateName(nameController.text);
    if (nameError != null) {
      CustomToast.showError(nameError);
      return false;
    }
    // Email Validation
    final emailError = Validators.validateEmail(emailController.text);
    if (emailError != null) {
      CustomToast.showError(emailError);
      return false;
    }
    // Password Validation
    final passwordError = Validators.validatePassword(passwordController.text);
    if (passwordError != null) {
      CustomToast.showError(passwordError);
      return false;
    }
    return true;
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
