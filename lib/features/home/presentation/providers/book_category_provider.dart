import 'package:book_app_intern_project/features/home/data/home_repository_impl.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../states/book_category_state.dart';

final bookCategoryProvider =
    StateNotifierProvider<BookCategoryNotifier, BookCategoryState>((ref) {
  final repository =
      HomeRepositoryImpl(apiService: ref.read(apiServiceProvider));
  return BookCategoryNotifier(repository);
});

class BookCategoryNotifier extends StateNotifier<BookCategoryState> {
  final HomeRepository repository;

  BookCategoryNotifier(this.repository) : super(BookCategoryState.initial()) {
    fetchBookCategories();
  }

  Future<void> fetchBookCategories() async {
    try {
      final bookCategories = await repository.getBookCategories();

      state = state.copyWith(
        isLoading: false,
        bookCategories: bookCategories,
        selectedCategoryIndex: -1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void selectCategory(int index) {
    if (index == 0) {
      state = state.copyWith(selectedCategoryIndex: -1);
    } else {
      state = state.copyWith(selectedCategoryIndex: index);
    }
  }
}
