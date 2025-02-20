import 'package:book_app_intern_project/features/auth/domain/repositories/register_repository.dart';
import 'package:book_app_intern_project/services/network/services.dart';
import 'package:dio/dio.dart';
import '../../../../core/constant/api_routes.dart';

/// RegisterRepositoryImpl is a class that implements the RegisterRepository interface,
/// providing a concrete implementation for handling user registration.
class RegisterRepositoryImpl implements RegisterRepository {
  final ApiService apiService;

  RegisterRepositoryImpl(this.apiService);

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
