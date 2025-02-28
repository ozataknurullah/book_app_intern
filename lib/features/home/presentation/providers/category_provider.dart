import 'package:book_app_intern_project/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/home_repository.dart';
import '../states/category_state.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier(categoryRepository: ref.read(homeRepositoryProvider));
});

class CategoryNotifier extends StateNotifier<CategoryState> {
  final HomeRepository categoryRepository;

  CategoryNotifier({required this.categoryRepository})
      : super(CategoryState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = state.copyWith(isLoading: true, categories: []);
    try {
      final categories = await categoryRepository.getCategories();
      state = CategoryState(isLoading: false, categories: categories);
    } catch (e) {
      state = CategoryState(
          isLoading: false, categories: [], errorMessage: e.toString());
    }
  }
}
