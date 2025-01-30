import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
// import 'package:book_app_intern_project/features/home/data/datasources/category_datasource.dart';
// import 'package:book_app_intern_project/features/home/domain/repositories/book_category_repository.dart';
// import 'package:book_app_intern_project/features/home/domain/repositories/category_repository.dart';
// import 'package:book_app_intern_project/features/home/domain/models/book_category_model.dart';
// import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';
// import 'package:book_app_intern_project/features/home/presentation/states/book_category_state.dart';
// import 'package:book_app_intern_project/features/home/presentation/widgets/book_category_section.dart';
// import 'package:book_app_intern_project/features/home/presentation/widgets/custom_search_field.dart';
// import 'package:book_app_intern_project/core/routes/app_router.dart';
import 'package:book_app_intern_project/features/home/presentation/providers/book_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_search_field.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookCategoryState = ref.watch(bookCategoryProvider);
    final bookCategoryNotifier = ref.read(bookCategoryProvider.notifier);
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: "Catalog", showBackButton: false),
      body: bookCategoryState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                //Book Categories Section
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 15.h),
                  child: SizedBox(
                    height: 42.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final isSelected =
                            bookCategoryState.selectedCategoryIndex == index;
                        return GestureDetector(
                          onTap: () =>
                              bookCategoryNotifier.selectCategory(index),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: isSelected
                                  ? AppTheme.lightTheme.colorScheme.secondary
                                  : const Color(0xFFF4F4FF),
                            ),
                            child: Center(
                              child: Text(
                                bookCategoryState.bookCategories[index].name!,
                                style: isSelected
                                    ? AppTheme.lightTheme.textTheme.bodySmall
                                        ?.copyWith(
                                        color: Colors.white,
                                      )
                                    : AppTheme.lightTheme.textTheme.bodySmall
                                        ?.copyWith(
                                        color:
                                            const Color.fromARGB(100, 0, 0, 0),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: bookCategoryState.bookCategories.length,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: CustomSearchField(
                      controller: searchController, hintText: "Search"),
                ),
                SizedBox(height: 20.h),
                // Expanded(
                //   child: ListView.builder(
                //     padding: EdgeInsets.only(top: 20.h),
                //     itemCount: categories.length,
                //     itemBuilder: (context, index) {
                //       final category = categories[index];
                //       return GestureDetector(
                //         onTap: () {
                //           context.pushRoute(const BookDetailRoute());
                //         },
                //         child: BookCategorySection(
                //           categoryTitle: category.title,
                //           books: category.books,
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
    );
  }
}
