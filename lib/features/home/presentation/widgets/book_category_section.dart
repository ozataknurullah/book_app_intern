import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/horizantal_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_router.dart';

class BookCategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<BookModel> books;
  final void Function(BookModel book) onBookTap;

  const BookCategorySection({
    super.key,
    required this.categoryTitle,
    required this.books,
    required this.onBookTap,
  });

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
                onPressed: () {
                  context.pushRoute(
                    CategoryRoute(
                      categoryTitle: categoryTitle,
                      books: books,
                    ),
                  );
                },
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
                itemCount: books.length > 4 ? 4 : books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () => onBookTap(book),
                    child: HorizantalBookCard(
                      book: books[index],
                    ),
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
