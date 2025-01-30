import 'package:book_app_intern_project/features/home/domain/models/book_category_model.dart';

class BookCategoryDataSource {
  Future<List<BookCategoryModel>> fetchBookCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BookCategoryModel(id: "0", name: "All"),
      BookCategoryModel(id: "1", name: "Classic"),
      BookCategoryModel(id: "2", name: "Horror"),
      BookCategoryModel(id: "3", name: "Romance"),
      BookCategoryModel(id: "4", name: "Adventure"),
    ];
  }
}
