import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';
import '../../domain/repositories/fav_repository.dart';

class FavRepositoryImpl implements FavRepository {
  final ApiService apiService;
  FavRepositoryImpl(this.apiService);

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
