import '../../domain/models/book_model.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource bookDataSource;

  BookRepositoryImpl(this.bookDataSource);

  @override
  Future<List<BookModel>> getBooksByCategory(int categoryId) async {
    return await bookDataSource.getBooksByCategory(categoryId);
  }

}
