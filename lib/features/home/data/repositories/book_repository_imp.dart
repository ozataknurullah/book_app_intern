import '../../domain/models/book_model.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource bookDataSource;

  BookRepositoryImpl(this.bookDataSource);

  @override
  Future<List<BookModel>> getBooksByCategory(int categoryId) async {
    ///  Retrieves a list of books by a specific category ID from the book data
    /// source and returns a future containing the list of BookModel objects.
    return await bookDataSource.getBooksByCategory(categoryId);
  }
}
