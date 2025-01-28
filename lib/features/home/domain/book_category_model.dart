class BookCategoryModel {
  String? id;
  String? name;

  BookCategoryModel({
    required this.id,
    required this.name,
  });

  static List<BookCategoryModel> getBookCategories() {
    List<BookCategoryModel> bookCategories = [];

    bookCategories.add(BookCategoryModel(name: "All", id: "0"));
    bookCategories.add(BookCategoryModel(name: "Classic", id: "1"));
    bookCategories.add(BookCategoryModel(name: "Horror", id: "2"));
    bookCategories.add(BookCategoryModel(name: "Romance", id: "3"));
    bookCategories.add(BookCategoryModel(name: "Adventure", id: "4"));

    return bookCategories;
  }
}
