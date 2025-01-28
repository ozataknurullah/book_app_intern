import 'book_model.dart';

class CategoryModel {
  final String title;
  final List<BookModel> books;

  CategoryModel({
    required this.title,
    required this.books,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      title: "Best Seller",
      books: BookModel.bestSellerBooks,
    ),
    CategoryModel(
      title: "Classics",
      books: BookModel.classicBooks,
    ),
    CategoryModel(
      title: "Children",
      books: BookModel.childrenBooks,
    ),
  ];
}
