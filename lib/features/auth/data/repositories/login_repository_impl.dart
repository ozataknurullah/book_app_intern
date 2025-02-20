import 'package:book_app_intern_project/services/network/services.dart';
import 'package:dio/dio.dart';
import '../../../../core/constant/api_routes.dart';
import '../../domain/repositories/login_repository.dart';

//LoginRepositoryImpl is a class that implements the LoginRepository interface, providing a concrete implementation for handling login functionality.
class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;

  LoginRepositoryImpl(this.apiService);

  ///LOGIN Http request
  /// Initializes the class with an instance of ApiService, which is used to make HTTP requests.
  @override
  Future<String> login(String email, String password) async {
    ///Makes a POST request to the login API endpoint with the provided email and password,
    ///and returns the authentication token if successful.
    ///If the request fails, it catches exceptions and throws a custom error message.
    try {
      final response = await apiService.post(
        ApiRoutes.login,
        {'email': email, 'password': password},
      );
      return response['action_login']['token'];
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception(
            'Giriş işlemi başarısız oldu. Lütfen bilgilerinizi kontrol ediniz.');
      }
      throw Exception('Bir hata oluştu. Lütfen tekrar deneyiniz.');
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu.');
    }
  }
}
