import '../models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBooksByCategory(int categoryId);
}
