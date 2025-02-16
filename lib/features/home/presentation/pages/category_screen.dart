import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/custom_search_field.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/vertical_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_router.dart';

@RoutePage()
class CategoryScreen extends ConsumerWidget {
  final String categoryTitle;
  final List<BookModel> books;
  CategoryScreen({
    super.key,
    required this.categoryTitle,
    required this.books,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(title: categoryTitle, showBackButton: true),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            _SearchField(searchController: searchController),
            SizedBox(height: 20.h),
            _BookGridView(books: books),
          ],
        ),
      ),
    );
  }
}

class _BookGridView extends StatelessWidget {
  const _BookGridView({
    required this.books,
  });

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: (1.sw / 2) / 380.h,
          ),
          itemBuilder: (context, index) {
            final book = books[index];
            return GestureDetector(
              onTap: () {
                context.pushRoute(
                    const HomeRoute()); //context.pushRoute(BookDetailRoute(bookId: book.id));
              },
              child: VerticalBookCard(
                book: book,
              ),
            );
          },
          itemCount: books.length),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child:
          CustomSearchField(controller: searchController, hintText: "Search"),
    );
  }
}
