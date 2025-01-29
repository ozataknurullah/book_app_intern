import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/features/home/domain/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<BookModel> books;
  final VoidCallback onViewAll;

  const BookCategorySection(
      {super.key,
      required this.categoryTitle,
      required this.books,
      required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // Category title and viewAll text button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(categoryTitle,
                  style: AppTheme.lightTheme.textTheme.bodyLarge),
              TextButton(
                onPressed: onViewAll,
                child: Text(
                  'View All',
                  style: AppTheme.lightTheme.textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: SizedBox(
            height: 140.h,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 25.h,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookCard(
                    book: books[index],
                    isHorizontal: true,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
