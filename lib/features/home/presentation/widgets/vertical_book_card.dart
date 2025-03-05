import 'package:book_app_intern_project/core/theme/color_theme.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/load_book_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/book_model.dart';

class VerticalBookCard extends StatelessWidget {
  final BookModel book;
  const VerticalBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha(45),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Picture
          LoadBookImagesWidget(
            fileName: book.cover,
            width: 170.w,
            height: 284.h,
          ),
          SizedBox(height: 8.h),
          // Book Name
          _BookTitle(book: book),
          SizedBox(height: 4.h),
          _AuthorAndPrice(book: book),
        ],
      ),
    );
  }
}

class _AuthorAndPrice extends StatelessWidget {
  const _AuthorAndPrice({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              book.author,
              style: AppTheme.lightTheme.textTheme.displaySmall
                  ?.copyWith(color: AppColors.black, fontSize: 8.sp),
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ),
        // Price
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "\$${book.price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.purple,
            ),
          ),
        ),
      ],
    );
  }
}

class _BookTitle extends StatelessWidget {
  const _BookTitle({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        book.name,
        style: AppTheme.lightTheme.textTheme.displayMedium
            ?.copyWith(color: AppColors.black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
