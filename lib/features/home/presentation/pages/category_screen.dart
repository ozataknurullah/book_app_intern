import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/routes/app_router.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/domain/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/custom_search_field.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/vertical_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  final String categoryTitle;
  final List<BookModel> books;
  const CategoryScreen({
    super.key,
    required this.categoryTitle,
    required this.books,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.categoryTitle, showBackButton: false),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: CustomSearchField(
                  controller: searchController, hintText: "Search"),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: (1.sw / 2) / 380.h,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushRoute(const BookDetailRoute());
                      },
                      child: VerticalBookCard(
                        book: widget.books[index],
                      ),
                    );
                  },
                  itemCount: widget.books.length),
            ),
          ],
        ),
      ),
    );
  }
}
