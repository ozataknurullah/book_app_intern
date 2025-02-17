class FavState {
  final Map<int, bool> favoriteBooks;
  final double scale;

  FavState({required this.favoriteBooks, required this.scale});

  FavState copyWith({Map<int, bool>? favoriteBooks, double? scale}) {
    return FavState(
      favoriteBooks: favoriteBooks ?? this.favoriteBooks,
      scale: scale ?? this.scale,
    );
  }

  factory FavState.initial() => FavState(
        favoriteBooks: {},
        scale: 1.0,
      );
}
