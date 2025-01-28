import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/domain/category_model.dart';
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
  List<CategoryModel> categories = [];
  final TextEditingController searchController = TextEditingController();

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
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
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 10.h, top: 10.h, right: 15.w, left: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categorySection(),
            SizedBox(height: 20.h),
            CustomSearchField(controller: searchController, hintText: "Search"),
            SizedBox(height: 20.h),
          ],
        ),
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
                    categories[index].name!,
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
          itemCount: categories.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 8.w,
          ),
        ),
      ),
    );
  }
}
