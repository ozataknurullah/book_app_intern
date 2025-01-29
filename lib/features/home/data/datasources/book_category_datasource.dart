import 'package:book_app_intern_project/features/home/domain/book_category_model.dart';

class BookCategoryDatasource {
  List<BookCategoryModel> fetchCategories() {
    return [
      BookCategoryModel(id: "0", name: "All"),
      BookCategoryModel(id: "1", name: "Classic"),
      BookCategoryModel(id: "2", name: "Horror"),
      BookCategoryModel(id: "3", name: "Romance"),
      BookCategoryModel(id: "4", name: "Adventure"),
    ];
  }
}
