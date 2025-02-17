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
  Future<void> toggleFavorite(
      {required int userId, required int productId}) async {
    state = state.copyWith(scale: 0.7);
    await Future.delayed(const Duration(milliseconds: 150));
    final currentFavState = state.favoriteBooks[productId] ?? false;

    try {
      if (!currentFavState) {
        print("[FavNotifier] Sending like request");
        await favRepository.likeProduct(userId: userId, productId: productId);
        state = state
            .copyWith(favoriteBooks: {...state.favoriteBooks, productId: true});
      } else {
        print("[FavNotifier] Sending unlike request");
        await favRepository.unlikeProduct(userId: userId, productId: productId);
        state = state.copyWith(
            favoriteBooks: {...state.favoriteBooks, productId: false});
      }
    } catch (e) {
      print("[FavNotifier] Error: $e");
    }
    state = state.copyWith(scale: 1.0);
  }
}
