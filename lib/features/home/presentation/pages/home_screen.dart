import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../domain/models/category_model.dart';
import '../widgets/book_category_section.dart';
import '../widgets/custom_search_field.dart';
import '../providers/book_provider.dart';
import '../states/book_category_state.dart';
import '../states/category_state.dart';
import '../widgets/custom_drawer.dart';
import '../providers/book_category_provider.dart';
import '../providers/category_provider.dart';
import '../widgets/shimmer_home_screen.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //For the top categories and this is static var
    final bookCategoryState = ref.watch(bookCategoryProvider);
    final bookCategoryNotifier = ref.read(bookCategoryProvider.notifier);
    final categoryState = ref.watch(categoryProvider);
    final categoryNotifier = ref.read(categoryProvider.notifier);

    final TextEditingController searchController = TextEditingController();
    if (bookCategoryState.errorMessage != null ||
        categoryState.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CustomToast.showError(AppStrings.networkError);
      });
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Catalog",
        showBackButton: false,
      ),
      drawer: const CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await categoryNotifier.fetchCategories();
          await bookCategoryNotifier.fetchBookCategories();
        },
        child: (bookCategoryState.isLoading || categoryState.isLoading)
            ? const ShimmerHomeScreen()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  _HorizantalBookCategorySection(
                      bookCategoryState: bookCategoryState,
                      bookCategoryNotifier: bookCategoryNotifier),
                  SizedBox(height: 20.h),
                  _SearchField(searchController: searchController),
                  SizedBox(height: 20.h),
                  _BookSliderSection(
                    categoryState: categoryState,
                    selectedCategoryIndex:
                        bookCategoryState.selectedCategoryIndex,
                  ),
                ],
              ),
      ),
    );
  }
}

class _BookSliderSection extends ConsumerWidget {
  const _BookSliderSection({
    required this.categoryState,
    required this.selectedCategoryIndex,
  });
  final CategoryState categoryState;
  final int selectedCategoryIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryIndex =
        ref.watch(bookCategoryProvider).selectedCategoryIndex;
    final filteredCategories = selectedCategoryIndex == -1
        ? categoryState.categories
        : [categoryState.categories[selectedCategoryIndex]];

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20.h),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final CategoryModel category = filteredCategories[index];
          final bookState = ref.watch(bookProvider(category.id));
          return BookCategorySection(
            category: category,
            bookState: bookState,
            onBookTap: (book) {},
          );
        },
      ),
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
            final isSelected = (bookCategoryState.selectedCategoryIndex ==
                    index) ||
                (index == 0 && bookCategoryState.selectedCategoryIndex == -1);
            return GestureDetector(
              onTap: () {
                bookCategoryNotifier.selectCategory(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: isSelected ? AppColors.secondary : AppColors.darkWhite,
                ),
                child: Center(
                  child: Text(
                    bookCategoryState.bookCategories[index].name!,
                    style: isSelected
                        ? AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: AppColors.darkWhite,
                          )
                        : AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
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

class _SearchField extends ConsumerWidget {
  const _SearchField({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Hero(
        tag: "searchBar",
        child: Material(
          type: MaterialType.transparency,
          child: CustomSearchField(
            controller: searchController,
            hintText: "Search",
            onTap: () {
              FocusScope.of(context).unfocus();

              context.pushRoute(
                SearchResultsRoute(initialQuery: searchController.text),
              );
            },
          ),
        ),
      ),
    );
  }
}
