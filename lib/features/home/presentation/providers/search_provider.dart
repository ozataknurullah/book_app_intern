import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/book_model.dart';
import 'all_book_provider.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchNotifier, List<BookModel>>((ref) {
  return SearchNotifier(ref.watch(allBooksProvider));
});
final searchQueryProvider = StateProvider.autoDispose<String>((ref) => "");

class SearchNotifier extends StateNotifier<List<BookModel>> {
  final List<BookModel> allBooks;

  SearchNotifier(this.allBooks) : super([]);

  void search(String query) {
    if (query.isEmpty) {
      state = [];
    } else {
      state = allBooks
          .where((book) =>
              book.name.toLowerCase().contains(query.toLowerCase()) ||
              book.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
