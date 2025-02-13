import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';

class BookCoverDataSource {
  final ApiService apiService;

  BookCoverDataSource(this.apiService);

  Future<String> getBookCover(String fileName) async {
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
}
