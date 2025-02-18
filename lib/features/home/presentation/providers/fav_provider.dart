import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/repositories/fav_repository.dart';
import '../states/fav_state.dart';

final favProvider = StateNotifierProvider<FavNotifier, FavState>(
  (ref) {
    final repo = ref.read(favRepositoryProvider);
    return FavNotifier(repo);
  },
);

class FavNotifier extends StateNotifier<FavState> {
  final FavRepository favRepository;

  FavNotifier(this.favRepository) : super(FavState.initial());
  Future<void> toggleFavorite({
    required int userId,
    required int productId,
    required bool currentFavoriteStatus,
  }) async {
    final isCurrentlyFavorited = state.favoriteBooks.containsKey(productId)
        ? state.favoriteBooks[productId]
        : currentFavoriteStatus;
    await Future.delayed(const Duration(milliseconds: 150));
    state = state.copyWith(scale: 0.7);

    try {
      if (isCurrentlyFavorited!) {
        print(
            "[FavNotifier] Sending unlike request for productId: $productId, userId: $userId");
        await favRepository.unlikeProduct(userId: userId, productId: productId);
        state = state.copyWith(
            favoriteBooks: {...state.favoriteBooks, productId: false});
      } else {
        print(
            "[FavNotifier] Sending like request for productId: $productId, userId: $userId");
        await favRepository.likeProduct(userId: userId, productId: productId);
        state = state
            .copyWith(favoriteBooks: {...state.favoriteBooks, productId: true});
      }
    } catch (e) {
      print("[FavNotifier] Error: $e");
    }
    state = state.copyWith(scale: 1.0);
  }

  void resetFavorites() {
    state = FavState.initial();
  }
}
