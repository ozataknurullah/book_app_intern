import 'package:book_app_intern_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:book_app_intern_project/services/local/local_stroge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/auth_token.dart';

import '../../../../core/providers/providers.dart';
import '../states/login_state.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(loginRepository: ref.read(authRepositoryProvider));
});

final rememberMeProvider = StateProvider.autoDispose<bool>((ref) => false);

class LoginNotifier extends StateNotifier<LoginState> {
  /// Initializes the LoginNotifier instance with a required LoginRepository
  /// instance and sets the initial state to LoginState.initial().
  final AuthRepository loginRepository;

  LoginNotifier({required this.loginRepository}) : super(LoginState.initial());

  Future<void> login(String email, String password, bool rememberMe) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );

    try {
      final token = await loginRepository.login(email, password);
      state = state.copyWith(
        isLoading: false,
        token: token,
        errorMessage: null,
      );
      if (rememberMe) {
        await LocalStroge.saveToken(token);
      }
      AuthToken.token = token;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}
