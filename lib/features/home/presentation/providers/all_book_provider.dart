import 'package:book_app_intern_project/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/models/book_model.dart';

final allBooksProvider =
    StateNotifierProvider<BookNotifier, List<BookModel>>((ref) {
  final repository = ref.read(homeRepositoryProvider);
  return BookNotifier(repository);
});

class BookNotifier extends StateNotifier<List<BookModel>> {
  final HomeRepository bookRepository;

  BookNotifier(this.bookRepository) : super([]) {
    _fetchAllBooks();
  }

  Future<void> _fetchAllBooks() async {
    List<BookModel> allBooks = [];
    for (int categoryId = 1; categoryId <= 5; categoryId++) {
      try {
        final books = await bookRepository.getBooksByCategory(categoryId);
        allBooks.addAll(books);
      } catch (e) {
        throw Exception('Bir hata oluştu. Lütfen tekrar deneyiniz.');
      }
    }
    state = allBooks;
  }
}
