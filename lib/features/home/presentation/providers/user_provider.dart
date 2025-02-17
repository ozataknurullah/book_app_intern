import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/auth_token.dart';
import '../../../../services/local/local_stroge.dart';
import '../../../../core/utils/jwt_helper.dart';

final userNameProvider = FutureProvider<String?>((ref) async {
  //First look for local Storge token
  String? token = await LocalStroge.getToken();
  //If not found, look for token in cached
  token ??= AuthToken.token;
  if (token != null && JwtHelper.isTokenValid(token)) {
    final payload = JwtHelper.getPayload(token);
    return payload['email'] as String?;
  }
  return null;
});

final userIdProvider = FutureProvider<int?>((ref) async {
//First look for local Storge token
  String? token = await LocalStroge.getToken();
  //If not found, look for token in cached
  token ??= AuthToken.token;
  if (token != null && JwtHelper.isTokenValid(token)) {
    final payload = JwtHelper.getPayload(token);
    return payload['user_id'] as int?;
  }
  return null;
});
