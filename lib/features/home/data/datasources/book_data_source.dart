import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';
import '../../domain/models/book_model.dart';

class BookDataSource {
  final ApiService apiService;

  BookDataSource(this.apiService);

  Future<List<BookModel>> getBooksByCategory(int categoryId) async {
    /// Makes a GET request to the API using ApiService to retrieve a list of books by category ID.
    try {
      /// Returns a list of BookModel objects parsed from the API response,

      final url = ApiRoutes.getProducts(categoryId);
      final response = await apiService.get(url);
      List<dynamic> bookList = response['product'];

      return bookList.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      /// or throws an exception if the request fails.
      throw Exception("Api Errror: $e");
    }
  }
}
