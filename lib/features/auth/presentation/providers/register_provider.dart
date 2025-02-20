import 'package:book_app_intern_project/features/auth/domain/repositories/register_repository.dart';
import 'package:book_app_intern_project/features/auth/presentation/states/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';

/// RegisterNotifier provider
final registerNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(
      registerRepository: ref.read(registerRepositoryProvider));
});

class RegisterNotifier extends StateNotifier<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterNotifier({required this.registerRepository})
      : super(RegisterState.initial());

  /// REGISTER
  /// Handles user registration by calling the register method of the RegisterRepository instance.
  /// It updates the state to indicate loading, attempts to register, and then updates the state with
  /// the result (either success or error).
  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    try {
      await registerRepository.register(name, email, password);
      state = state.copyWith(
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}
