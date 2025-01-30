import 'package:book_app_intern_project/features/home/domain/repositories/book_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/book_category_datasource.dart';
import '../../data/repositories/book_category_repository_impl.dart';
import '../states/book_category_state.dart';

final bookCategoryProvider =
    StateNotifierProvider<BookCategoryNotifier, BookCategoryState>((ref) {
  final repository = BookCategoryRepositoryImpl(BookCategoryDataSource());
  return BookCategoryNotifier(repository);
});

class BookCategoryNotifier extends StateNotifier<BookCategoryState> {
  final BookCategoryRepository repository;

  BookCategoryNotifier(this.repository) : super(BookCategoryState.initial()) {
    fetchBookCategories();
  }

  Future<void> fetchBookCategories() async {
    state = BookCategoryState(
        isLoading: true,
        bookCategories: [],
        selectedCategoryIndex: state.selectedCategoryIndex);
    try {
      final bookCategories = await repository.getBookCategories();
      state = BookCategoryState(
          isLoading: false,
          bookCategories: bookCategories,
          selectedCategoryIndex: state.selectedCategoryIndex);
    } catch (e) {
      state = BookCategoryState(
          isLoading: false,
          bookCategories: [],
          errorMessage: e.toString(),
          selectedCategoryIndex: state.selectedCategoryIndex);
    }
  }

  void selectCategory(int index) {
    state = state.copyWith(selectedCategoryIndex: index);
  }
}
