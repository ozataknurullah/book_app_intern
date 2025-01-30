import 'book_model.dart';

class CategoryModel {
  final String title;
  final List<BookModel> books;

  CategoryModel({
    required this.title,
    required this.books,
  });
}
