import '../models/book_model.dart';

abstract class BookDetailRepository {
  Future<BookModel> getBookDetails(String bookId);
}
