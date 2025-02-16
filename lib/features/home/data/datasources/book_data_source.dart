import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';
import '../../domain/models/book_model.dart';

class BookDataSource {
  final ApiService apiService;

  BookDataSource(this.apiService);

  Future<List<BookModel>> getBooksByCategory(int categoryId) async {
    try {
      final url = ApiRoutes.getProducts(categoryId);
      final response = await apiService.get(url);
      List<dynamic> bookList = response['product'];

      // İlk öğeyi detaylı yazdırarak JSON formatını kontrol edelim
      if (bookList.isNotEmpty) {}

      return bookList.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Api Errror: $e");
    }
  }
}
