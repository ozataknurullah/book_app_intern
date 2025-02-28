import 'package:book_app_intern_project/services/network/services.dart';
import 'package:dio/dio.dart';
import '../../../../core/constant/api_routes.dart';
import '../domain/repositories/auth_repository.dart';

/// RegisterRepositoryImpl is a class that implements the RegisterRepository interface,
/// providing a concrete implementation for handling user registration.
class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

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

  ///REGISTER
  /// Initializes the class with an instance of ApiService, which is used to make API requests.
  @override
  Future<String> register(String name, String email, String password) async {
    try {
      final response = await apiService.post(
        ApiRoutes.register,
        {'name': name, 'email': email, 'password': password},
      );
      return response['action_register']['token'];
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception(
            'Kayıt işlemi başarısız oldu. Lütfen bilgilerinizi kontrol ediniz');
      }
      throw Exception('Bir hata oluştu. Lütfen tekrar deneyiniz.');
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu.');
    }
  }
}
