import 'package:book_app_intern_project/features/home/data/repositories/category_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/category_datasource.dart';
import '../../domain/repositories/category_repository.dart';
import '../states/category_state.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  final repository = CategoryRepositoryImpl(CategoryDataSource());
  return CategoryNotifier(repository);
});

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryRepository repository;

  CategoryNotifier(this.repository) : super(CategoryState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = CategoryState(isLoading: true, categories: []);
    try {
      final categories = await repository.getCategories();
      state = CategoryState(isLoading: false, categories: categories);
    } catch (e) {
      state = CategoryState(
          isLoading: false, categories: [], errorMessage: e.toString());
    }
  }
}
