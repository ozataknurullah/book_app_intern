import 'package:book_app_intern_project/features/auth/domain/repositories/register_repository.dart';
import 'package:book_app_intern_project/features/auth/presentation/states/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';

/// RegisterNotifier provider
final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(
      registerRepository: ref.read(registerRepositoryProvider));
});

class RegisterNotifier extends StateNotifier<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterNotifier({required this.registerRepository})
      : super(RegisterState.initial());

  /// REGISTER
  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await registerRepository.register(name, email, password);
      state = state.copyWith(
          isLoading: false,
          token: token,
          successMessage: "Kayıt başarılı! Şimdi giriş yapabilirsiniz.");
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Kayıt başarısız: ${e.toString()}",
        successMessage: null,
      );
    }
  }
}
