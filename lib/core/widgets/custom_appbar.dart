import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: AppTheme.lightTheme.textTheme.bodyLarge,
        ),
      ),
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                'assets/images/Logo.svg',
                height: 50.sp,
              ),
            )
          : const BackButton(),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: const Color.fromARGB(10, 0, 0, 0),
            height: 1,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
