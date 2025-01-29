import 'package:book_app_intern_project/features/home/data/datasources/category_datasource.dart';
import 'package:book_app_intern_project/features/home/domain/category_model.dart';

class CategoryRepository {
  final CategoryDataSource dataSource;

  CategoryRepository({required this.dataSource});

  List<CategoryModel> getCategories() => dataSource.fetchCategories();
}
