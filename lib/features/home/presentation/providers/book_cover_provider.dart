import 'package:book_app_intern_project/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookCoverProvider =
    FutureProvider.family<String, String>((ref, fileName) async {
  final repository = ref.read(bookCoverRepositoryProvider);
  return await repository.getBookCover(fileName);
});
