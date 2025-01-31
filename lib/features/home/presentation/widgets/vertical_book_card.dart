import 'package:book_app_intern_project/core/constant/app_assets.dart';
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
        color: const Color(0xFFF4F4FF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(45),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Picture
          const _BookImage(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            book.author,
            style: AppTheme.lightTheme.textTheme.displaySmall?.copyWith(
                color: const Color.fromARGB(81, 0, 0, 0), fontSize: 8.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // Price
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "\$${book.price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
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
        book.title,
        style: AppTheme.lightTheme.textTheme.displayMedium
            ?.copyWith(color: Colors.black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _BookImage extends StatelessWidget {
  const _BookImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: Image.asset(
          AppAssets.book,
        ),
      ),
    );
  }
}
