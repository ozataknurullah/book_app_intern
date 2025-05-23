import 'package:book_app_intern_project/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';

import '../states/book_state.dart';

final bookProvider = StateNotifierProvider.family<BookNotifier, BookState, int>(
    (ref, categoryId) {
  final repository = ref.read(homeRepositoryProvider);
  return BookNotifier(repository, categoryId);
});

class BookNotifier extends StateNotifier<BookState> {
  final HomeRepository bookRepository;
  final int categoryId;

  BookNotifier(
    this.bookRepository,
    this.categoryId,
  ) : super(BookState.initial()) {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      state = state.copyWith(isLoading: true, books: []);
      final books = await bookRepository.getBooksByCategory(categoryId);
      state = state.copyWith(isLoading: false, books: books);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
