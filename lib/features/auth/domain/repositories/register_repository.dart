/// This method is declared to handle the register functionality,
/// taking a name, an email and password as input and returning a
/// Future that resolves to a String ( likely a token or authentication result).
abstract class RegisterRepository {
  Future<String> register(String name, String email, String password);
}
