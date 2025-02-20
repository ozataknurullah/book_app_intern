import 'package:book_app_intern_project/features/home/data/datasources/book_category_data_source.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_category_model.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/book_category_repository.dart';

///  BookCategoryRepositoryImpl, implements the BookCategoryRepository interface and provides a concrete
/// implementation for fetching book categories
class BookCategoryRepositoryImpl implements BookCategoryRepository {
  final BookCategoryDataSource dataSource;

  BookCategoryRepositoryImpl(this.dataSource);

  @override

  /// Fetches a list of book categories from the data source and returns a future containing the
  /// list of BookCategoryModel objects.
  Future<List<BookCategoryModel>> getBookCategories() async {
    return dataSource.fetchBookCategories();
  }
}
