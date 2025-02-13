import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';

import '../../domain/models/book_model.dart';

class BookDataSource {
  final ApiService apiService;

  BookDataSource(this.apiService);

  Future<List<BookModel>> getBooksByCategory(int categoryId) async {
    try {
      final response = await apiService.get(ApiRoutes.getProducts(categoryId));

      List<dynamic> bookList = response.data['product'];
      return bookList.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Api Error");
    }
  }
}
