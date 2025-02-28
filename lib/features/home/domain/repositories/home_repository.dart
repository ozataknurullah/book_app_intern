import '../models/book_category_model.dart';
import '../models/book_model.dart';
import '../models/category_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
  Future<void> likeProduct({required int userId, required int productId});
  Future<void> unlikeProduct({required int userId, required int productId});
  Future<List<BookModel>> getBooksByCategory(int categoryId);
  Future<String> getBookCover(String fileName);
  Future<List<BookCategoryModel>> getBookCategories();
}
