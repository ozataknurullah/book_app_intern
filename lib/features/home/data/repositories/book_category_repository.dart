import 'package:book_app_intern_project/features/home/data/datasources/book_category_datasource.dart';
import 'package:book_app_intern_project/features/home/domain/book_category_model.dart';

class BookCategoryRepository {
  final BookCategoryDatasource bookCategoryDatasource;

  BookCategoryRepository({required this.bookCategoryDatasource});

  List<BookCategoryModel> getCategories() =>
      bookCategoryDatasource.fetchCategories();
}
