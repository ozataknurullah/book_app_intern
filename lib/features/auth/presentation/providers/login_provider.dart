import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/login_repository.dart';
import '../../../../core/providers/providers.dart';
import '../states/login_state.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(loginRepository: ref.read(loginRepositoryProvider));
});

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository loginRepository;

  LoginNotifier({required this.loginRepository}) : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      final token = await loginRepository.login(email, password);
      state = state.copyWith(
        isLoading: true,
        token: token,
        errorMessage: null,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        shouldShowDialog: true,
      );
    } catch (e) {
      state = state.copyWith(
          isLoading: false, errorMessage: e.toString(), shouldShowDialog: true);
    }
  }
}
