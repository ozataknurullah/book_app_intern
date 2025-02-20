/// This method is declared to handle the login functionality,
/// taking an email and password as input and returning a Future
/// that resolves to a String ( likely a token or authentication result).
abstract class LoginRepository {
  Future<String> login(String email, String password);
}
