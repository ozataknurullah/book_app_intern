import 'package:book_app_intern_project/core/constant/api_routes.dart';
import 'package:book_app_intern_project/services/network/services.dart';
import '../../domain/repositories/fav_repository.dart';

class FavRepositoryImpl implements FavRepository {
  final ApiService apiService;
  FavRepositoryImpl(this.apiService);

  @override
  Future<bool> likeProduct(
      {required int userId, required int productId}) async {
    const endpoint = ApiRoutes.like;
    final data = {"user_id": userId, "product_id": productId};
    try {
      print("[FavRepositoryImpl] Sending like request: $data");
      await apiService.post(endpoint, data);
      return true;
    } catch (e) {
      print("[FavRepositoryImpl] Like request failed: $e");
      throw Exception("Like işlemi başarısız: $e");
    }
  }

  @override
  Future<bool> unlikeProduct(
      {required int userId, required int productId}) async {
    const endpoint = ApiRoutes.unlike;
    final data = {"user_id": userId, "product_id": productId};
    try {
      print("[FavRepositoryImpl] Sending unlike request: $data");
      final response = await apiService.post(endpoint, data);

      if (response["delete_like"]["affected_rows"] == 1) {
        return false; // Unlike başarılı
      } else {
        return true; // Unlike başarısız
      }
    } catch (e) {
      print("[FavRepositoryImpl] Unlike request failed: $e");
      throw Exception("Unlike işlemi başarısız: $e");
    }
  }
}
