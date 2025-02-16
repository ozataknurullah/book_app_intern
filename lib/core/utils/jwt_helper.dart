import 'package:jwt_decoder/jwt_decoder.dart';

//Check if the token expired
class JwtHelper {
  static bool isTokenValid(String token) {
    if (JwtDecoder.isExpired(token)) {
      return false;
    }
    return true;
  }

  static Map<String, dynamic> getPayload(String token) {
    return JwtDecoder.decode(token);
  }
}
