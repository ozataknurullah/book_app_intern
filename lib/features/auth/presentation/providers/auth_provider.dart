import 'package:book_app_intern_project/core/utils/jwt_helper.dart';
import 'package:book_app_intern_project/services/local/local_stroge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enum/auth_status.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier() : super(AuthStatus.unknown);

  Future<void> checkAuthStatus() async {
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
