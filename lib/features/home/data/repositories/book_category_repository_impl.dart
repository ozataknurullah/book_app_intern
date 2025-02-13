import 'package:book_app_intern_project/features/home/data/datasources/book_category_data_source.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_category_model.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/book_category_repository.dart';

class BookCategoryRepositoryImpl implements BookCategoryRepository {
  final BookCategoryDataSource dataSource;

  BookCategoryRepositoryImpl(this.dataSource);

  @override
  Future<List<BookCategoryModel>> getBookCategories() async {
    return dataSource.fetchBookCategories();
  }
}
