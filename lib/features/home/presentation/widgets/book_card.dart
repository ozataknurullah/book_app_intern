import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:book_app_intern_project/features/home/domain/book_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final bool isHorizontal; // True: for row, False: is for grid

  const BookCard({
    super.key,
    required this.book,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? _buildHorizontalCard() : _buildVerticalCard();
  }

  // This is for the row
  Widget _buildHorizontalCard() {
    return Container(
      width: 210.w,
      height: 140.h,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xFFF4F4FF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                'assets/images/book.png',
                width: 80.w,
                height: 120.h,
              ),
            ),
            SizedBox(width: 2.w),
            //Texts
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }

  // This is for grid layout
  Widget _buildVerticalCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFF4F4FF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Picture
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                'assets/images/book.png',
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Book Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              book.title,
              style: AppTheme.lightTheme.textTheme.displayMedium
                  ?.copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
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
          ),
        ],
      ),
    );
  }
}
