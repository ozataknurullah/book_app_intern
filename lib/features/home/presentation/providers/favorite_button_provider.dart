import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/favorite_button_state.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier() : super(FavoriteState.initial());

  Future<void> toggleFavorite() async {
    state = state.copyWith(scale: 0.7);
    await Future.delayed(const Duration(milliseconds: 150));

    state = state.copyWith(isFavorited: !state.isFavorited);

    state = state.copyWith(scale: 1.0);
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>(
  (ref) => FavoriteNotifier(),
);
