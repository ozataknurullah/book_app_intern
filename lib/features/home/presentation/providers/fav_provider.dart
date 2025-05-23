import 'package:book_app_intern_project/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../states/fav_state.dart';

final favProvider = StateNotifierProvider<FavNotifier, FavState>(
  (ref) {
    final repo = ref.read(homeRepositoryProvider);
    return FavNotifier(repo);
  },
);

class FavNotifier extends StateNotifier<FavState> {
  final HomeRepository favRepository;

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
        await favRepository.unlikeProduct(userId: userId, productId: productId);
        state = state.copyWith(
            favoriteBooks: {...state.favoriteBooks, productId: false});
      } else {
        await favRepository.likeProduct(userId: userId, productId: productId);
        state = state
            .copyWith(favoriteBooks: {...state.favoriteBooks, productId: true});
      }
    } catch (e) {
      throw Exception(e);
    }
    state = state.copyWith(scale: 1.0);
  }

  void resetFavorites() {
    state = FavState.initial();
  }
}
