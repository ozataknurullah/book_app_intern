import 'package:book_app_intern_project/features/home/domain/models/book_category_model.dart';

class BookCategoryState {
  final bool isLoading;
  final List<BookCategoryModel> bookCategories;
  final String? errorMessage;
  final int selectedCategoryIndex;

  BookCategoryState(
      {required this.isLoading,
      required this.bookCategories,
      required this.selectedCategoryIndex,
      this.errorMessage});

  factory BookCategoryState.initial() => BookCategoryState(
      isLoading: false, bookCategories: [], selectedCategoryIndex: 0);

  // We copy the state so we can just update the selectedCategoryIndex state
  BookCategoryState copyWith({
    bool? isLoading,
    List<BookCategoryModel>? bookCategories,
    String? errorMessage,
    int? selectedCategoryIndex,
  }) {
    return BookCategoryState(
      isLoading: isLoading ?? this.isLoading,
      bookCategories: bookCategories ?? this.bookCategories,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }
}
