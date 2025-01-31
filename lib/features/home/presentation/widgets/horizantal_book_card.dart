import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizantalBookCard extends StatelessWidget {
  final BookModel book;

  const HorizantalBookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      height: 140.h,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xFFF4F4FF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(45),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BookImage(),
            SizedBox(width: 2.w),
            //Texts
            _BookDetails(book: book),
          ],
        ),
      ),
    );
  }
}

class _BookImage extends StatelessWidget {
  const _BookImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image.asset(
        AppAssets.book,
        width: 80.w,
        height: 120.h,
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The Book Name
              Text(
                book.title,
                style: AppTheme.lightTheme.textTheme.headlineMedium,
                maxLines: null,
              ),
              SizedBox(height: 4.h),
              // The Authors
              Text(
                book.author,
                style: AppTheme.lightTheme.textTheme.headlineSmall,
                maxLines: null,
              ),
            ],
          ),

          // The book price
          Column(
            children: [
              Text(
                "${book.price.toStringAsFixed(2)} \$",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A0DAD), // Mor renk
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
