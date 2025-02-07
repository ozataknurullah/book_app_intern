import 'package:book_app_intern_project/services/network/services.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/api_routes.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;

  LoginRepositoryImpl(this.apiService);

  ///LOGIN Http request
  @override
  Future<String> login(String email, String password) async {
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
