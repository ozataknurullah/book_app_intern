import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';

class BookState {
  final bool isLoading;
  final BookModel? book;
  final String? errorMessage;

  BookState({
    required this.isLoading,
    this.book,
    this.errorMessage,
  });

  factory BookState.initial() => BookState(isLoading: false, book: null);

  BookState copyWith({
    bool? isLoading,
    BookModel? book,
    String? errorMessage,
  }) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      book: book ?? this.book,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
