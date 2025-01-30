import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();
}
