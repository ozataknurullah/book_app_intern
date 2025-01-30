import '../models/book_category_model.dart';

abstract class BookCategoryRepository {
  Future<List<BookCategoryModel>> getBookCategories();
}
