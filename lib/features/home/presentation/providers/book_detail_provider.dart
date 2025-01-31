import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/category_datasource.dart';
import '../../data/repositories/book_detail_repository_imp.dart';
import '../../domain/repositories/book_detail_repository.dart';
import '../states/book_detail_state.dart';

final bookProvider =
    StateNotifierProvider.family<BookNotifier, BookState, String>(
        (ref, bookId) {
  final repository = BookRepositoryImpl(CategoryDataSource());
  return BookNotifier(repository, bookId);
});

class BookNotifier extends StateNotifier<BookState> {
  final BookDetailRepository repository;
  final String bookId;

  BookNotifier(this.repository, this.bookId) : super(BookState.initial()) {
    fetchBookDetails();
  }

  Future<void> fetchBookDetails() async {
    state = state.copyWith(isLoading: true);

    try {
      final book = await repository.getBookDetails(bookId);
      state = state.copyWith(isLoading: false, book: book);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
