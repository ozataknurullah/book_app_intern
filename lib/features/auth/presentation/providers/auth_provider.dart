import 'package:book_app_intern_project/core/utils/jwt_helper.dart';
import 'package:book_app_intern_project/services/local/local_stroge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/enum/auth_status.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthStatus>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier() : super(AuthStatus.unknown);

  Future<void> checkAuthStatus() async {
    ///Checks the authentication status by retrieving a token from local storage, validating it,
    ///and updating the state to either AuthStatus.authenticated or AuthStatus.unauthenticated accordingly.
    await Future.delayed(const Duration(seconds: 1));

    final token = await LocalStroge.getToken();
    if (token != null && JwtHelper.isTokenValid(token)) {
      state = AuthStatus.authenticated;
    } else {
      await LocalStroge.removeToken();
      state = AuthStatus.unauthenticated;
    }
  }
}
