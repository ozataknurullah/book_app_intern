import 'package:flutter/material.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = 20.h;
    final top = 20.h;
    final left = 15.w;
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: left, bottom: bottom, top: top),
          child: SvgPicture.asset(
            'assets/icons/search_icon.svg',
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: left, bottom: bottom, top: top),
            child: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF4F4FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        hintStyle: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
          color:
              AppTheme.lightTheme.textTheme.bodySmall?.color?.withOpacity(0.4),
        ),
      ),
    );
  }
}
