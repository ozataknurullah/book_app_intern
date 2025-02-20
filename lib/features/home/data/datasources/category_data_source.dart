import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';
import 'package:book_app_intern_project/services/network/services.dart';

class CategoryDataSource {
  final ApiService apiService;

  CategoryDataSource(this.apiService);

  Future<List<CategoryModel>> getCategories() async {
    ///  This method fetches a list of categories from the API, converts the response to a list of CategoryModel
    try {
      final response = await apiService.get(ApiRoutes.getCategories);

      List<dynamic> categoryList = response['category'];
      return categoryList.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Api error $e');
    }
  }
}
