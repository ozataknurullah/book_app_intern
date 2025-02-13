import 'package:book_app_intern_project/features/home/data/datasources/category_data_source.dart';
import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<List<CategoryModel>> getCategories() async {
    return categoryDataSource.getCategories();
  }
}
