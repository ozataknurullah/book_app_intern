import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';

class BookState {
  final bool isLoading;
  final List<BookModel> books;
  final String? errorMessage;

  BookState({
    required this.isLoading,
    required this.books,
    this.errorMessage,
  });

  factory BookState.initial() => BookState(isLoading: false, books: []);

  BookState copyWith({
    bool? isLoading,
    List<BookModel>? books,
    String? errorMessage,
  }) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
      errorMessage: errorMessage,
    );
  }
}
