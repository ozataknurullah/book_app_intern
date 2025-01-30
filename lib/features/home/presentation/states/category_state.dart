import 'package:book_app_intern_project/features/home/domain/models/category_model.dart';

class CategoryState {
  final bool isLoading;
  final List<CategoryModel> categories;
  final String? errorMessage;

  CategoryState(
      {required this.isLoading, required this.categories, this.errorMessage});

  factory CategoryState.initial() =>
      CategoryState(isLoading: false, categories: []);
}
