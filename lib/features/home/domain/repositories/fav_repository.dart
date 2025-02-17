abstract class FavRepository {
  Future<void> likeProduct({required int userId, required int productId});
  Future<void> unlikeProduct({required int userId, required int productId});
}
