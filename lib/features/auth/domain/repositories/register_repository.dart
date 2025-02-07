abstract class RegisterRepository {
  Future<String> register(String name, String email, String password);
}
