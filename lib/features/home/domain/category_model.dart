class CategoryModel {
  String? id;
  String? name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(name: "All", id: "1"));
    categories.add(CategoryModel(name: "Classic", id: "2"));
    categories.add(CategoryModel(name: "Horror", id: "3"));
    categories.add(CategoryModel(name: "Romance", id: "4"));

    return categories;
  }
}
