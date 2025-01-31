import '../../domain/models/book_model.dart';
import '../../domain/repositories/book_detail_repository.dart';
import '../datasources/category_datasource.dart';

class BookRepositoryImpl implements BookDetailRepository {
  final CategoryDataSource categoryDataSource;

  BookRepositoryImpl(this.categoryDataSource);

  @override
  Future<BookModel> getBookDetails(String bookId) async {
    final categories = categoryDataSource.fetchCategories();
    for (var category in categories) {
      for (var book in category.books) {
        if (book.id == bookId) {
          return book;
        }
      }
    }
    throw Exception("Book not found");
  }
}
