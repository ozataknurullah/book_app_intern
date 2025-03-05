import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/search_provider.dart';

class CustomSearchField extends ConsumerWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      onChanged: (query) {
        ref.read(searchProvider.notifier).search(query);
        if (onChanged != null) {
          onChanged!(query);
        }
      },
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 15.w, bottom: 20.h, top: 20.h),
          child: SvgPicture.asset(AppAssets.searchIcon),
        ),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  ref.read(searchProvider.notifier).search("");
                  if (onChanged != null) {
                    onChanged!("");
                  }
                },
              )
            : null,
        filled: true,
        fillColor: AppColors.darkWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        hintStyle: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
          color: AppTheme.lightTheme.textTheme.bodySmall?.color?.withAlpha(45),
        ),
      ),
    );
  }
}
