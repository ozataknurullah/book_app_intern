import 'package:dio/dio.dart';
import '../../../core/utils/auth_token.dart';
import '../../local/local_stroge.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Look for token in stroge
    String? token = await LocalStroge.getToken();
    // if not look for in-memory token
    token ??= AuthToken.token;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
