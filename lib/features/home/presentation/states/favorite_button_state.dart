class FavoriteState {
  final bool isFavorited;
  final double scale;

  FavoriteState({required this.isFavorited, required this.scale});

  FavoriteState copyWith({bool? isFavorited, double? scale}) {
    return FavoriteState(
      isFavorited: isFavorited ?? this.isFavorited,
      scale: scale ?? this.scale,
    );
  }

  factory FavoriteState.initial() =>
      FavoriteState(isFavorited: false, scale: 1.0);
}
