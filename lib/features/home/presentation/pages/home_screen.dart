import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';
import 'package:book_app_intern_project/features/home/presentation/providers/book_provider.dart';
import 'package:book_app_intern_project/features/home/presentation/states/book_category_state.dart';
import 'package:book_app_intern_project/features/home/presentation/states/category_state.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/custom_drawer.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/book_category_section.dart';
import '../widgets/custom_search_field.dart';
import '../../../../core/routes/app_router.dart';
import '../providers/book_category_provider.dart';
import '../providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //For the top categories and this is static var
    final bookCategoryState = ref.watch(bookCategoryProvider);
    final bookCategoryNotifier = ref.read(bookCategoryProvider.notifier);
    final categoryState = ref.watch(categoryProvider);

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Catalog",
        showBackButton: false,
      ),
      drawer: const CustomDrawer(),
      body: bookCategoryState.isLoading || categoryState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookCategoryState.errorMessage != null ||
                  categoryState.errorMessage != null
              ? Center(
                  child: Text(
                    bookCategoryState.errorMessage ??
                        categoryState.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    //Book Categories Section
                    _HorizantalBookCategorySection(
                        bookCategoryState: bookCategoryState,
                        bookCategoryNotifier: bookCategoryNotifier),
                    SizedBox(height: 20.h),
                    _SearchField(searchController: searchController),
                    SizedBox(height: 20.h),
                    _BookSliderSection(categoryState: categoryState),
                  ],
                ),
    );
  }
}

class _BookSliderSection extends ConsumerWidget {
  const _BookSliderSection({
    required this.categoryState,
  });
  final CategoryState categoryState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20.h),
        itemCount: categoryState.categories.length,
        itemBuilder: (context, index) {
          final CategoryModel category = categoryState.categories[index];
          final bookState = ref.watch(bookProvider(category.id));
          return BookCategorySection(
              category: category,
              bookState: bookState,
              onBookTap: (book) => context.pushRoute(
                  const HomeRoute()) //context.pushRoute(BookDetailRoute(bookId: book.id)),
              );
        },
      ),
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

//Top category
class _HorizantalBookCategorySection extends StatelessWidget {
  const _HorizantalBookCategorySection({
    required this.bookCategoryState,
    required this.bookCategoryNotifier,
  });

  final BookCategoryState bookCategoryState;
  final BookCategoryNotifier bookCategoryNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, top: 15.h),
      child: SizedBox(
        height: 42.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = bookCategoryState.selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => bookCategoryNotifier.selectCategory(index),
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
                        ? AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          )
                        : AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: const Color.fromARGB(100, 0, 0, 0),
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
    );
  }
}
