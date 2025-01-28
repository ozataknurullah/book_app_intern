import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/domain/book_category_model.dart';
import 'package:book_app_intern_project/features/home/domain/category_model.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/book_category_section.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  List<BookCategoryModel> bookCategories = [];
  final TextEditingController searchController = TextEditingController();
  final categories = CategoryModel.categories;

  void _getBookCategories() {
    bookCategories = BookCategoryModel.getBookCategories();
  }

  @override
  void initState() {
    super.initState();
    _getBookCategories();
  }

  void _onCategoryTap(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Catalog", showBackButton: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          categorySection(),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: CustomSearchField(
                controller: searchController, hintText: "Search"),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return BookCategorySection(
                  categoryTitle: category.title,
                  books: category.books,
                  onViewAll: () {
                    // View All tıklama işlevi
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding categorySection() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 15.h),
      child: SizedBox(
        height: 42.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => _onCategoryTap(index),
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
                    bookCategories[index].name!,
                    style: isSelected
                        ? AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          )
                        : AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: const Color.fromARGB(100, 0, 0, 0), //
                          ),
                  ),
                ),
              ),
            );
          },
          itemCount: bookCategories.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 8.w,
          ),
        ),
      ),
    );
  }
}
