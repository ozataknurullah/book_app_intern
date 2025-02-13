import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/horizantal_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_router.dart';
import '../states/book_state.dart';

class BookCategorySection extends StatelessWidget {
  final String categoryTitle;
  final BookState bookState;
  final void Function(BookModel book) onBookTap;

  const BookCategorySection({
    super.key,
    required this.categoryTitle,
    required this.bookState,
    required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CategoryTitleAndViewButton(
            categoryTitle: categoryTitle, books: bookState.books),
        const SizedBox(height: 16),
        if (bookState.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (bookState.errorMessage != null)
          Center(
            child: Text(bookState.errorMessage!,
                style: const TextStyle(color: Colors.red)),
          )
        else
          _BookSection(books: bookState.books, onBookTap: onBookTap),
      ],
    );
  }
}

class _BookSection extends StatelessWidget {
  const _BookSection({
    required this.books,
    required this.onBookTap,
  });

  final List<BookModel> books;
  final void Function(BookModel book) onBookTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  book: book,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryTitleAndViewButton extends StatelessWidget {
  const _CategoryTitleAndViewButton({
    required this.categoryTitle,
    required this.books,
  });

  final String categoryTitle;
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      // Category title and viewAll text button
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryTitle,
            style: AppTheme.lightTheme.textTheme.bodyLarge,
          ),
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
    );
  }
}
