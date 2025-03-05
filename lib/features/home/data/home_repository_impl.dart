import '../../../services/network/services.dart';
import '../domain/models/book_category_model.dart';
import '../domain/models/book_model.dart';
import '../domain/models/category_model.dart';
import '../../../core/constant/api_routes.dart';
import '../domain/repositories/home_repository.dart';

///  BookCategoryRepositoryImpl, implements the BookCategoryRepository interface and provides a concrete
/// implementation for fetching book categories
class HomeRepositoryImpl implements HomeRepository {
  final ApiService apiService;

  HomeRepositoryImpl({required this.apiService});
  @override
  Future<List<BookCategoryModel>> getBookCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BookCategoryModel(id: "0", name: "All"),
      BookCategoryModel(id: "1", name: "Classic"),
      BookCategoryModel(id: "2", name: "Children"),
      BookCategoryModel(id: "3", name: "Philosophy"),
      BookCategoryModel(id: "4", name: "Adventure"),
    ];
  }

  @override
  Future<String> getBookCover(String fileName) async {
    /// This method makes a POST request to the API
    try {
      final response = await apiService.post(
        ApiRoutes.coverImage,
        {"fileName": fileName},
      );
      return response["action_product_image"]["url"];
    } catch (e) {
      throw Exception("Api Error");
    }
  }

  @override
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

  @override
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

  @override
  Future<bool> likeProduct(

      /// Sends a POST request to the API to like a product, taking userId and productId as
      /// required parameters. Returns true if successful, or throws an exception if the request fails.
      {required int userId,
      required int productId}) async {
    const endpoint = ApiRoutes.like;
    final data = {"user_id": userId, "product_id": productId};
    try {
      await apiService.post(endpoint, data);
      return true;
    } catch (e) {
      throw Exception("Like işlemi başarısız: $e");
    }
  }

  @override
  Future<bool> unlikeProduct(

      ///  Sends a POST request to the API to unlike a product, taking userId and productId as required parameters.
      {required int userId,
      required int productId}) async {
    const endpoint = ApiRoutes.unlike;
    final data = {"user_id": userId, "product_id": productId};
    try {
      final response = await apiService.post(endpoint, data);

      if (response["delete_like"]["affected_rows"] == 1) {
        return false; // Unlike başarılı
      } else {
        return true; // Unlike başarısız
      }
    } catch (e) {
      throw Exception("Unlike işlemi başarısız: $e");
    }
  }
}
