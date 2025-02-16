import 'package:dio/dio.dart';

class ErrorMapper {
  static String getErrorMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Bağlantı zaman aşımına uğradı. Lütfen internet bağlantınızı kontrol edin.";
        case DioExceptionType.receiveTimeout:
          return "Sunucu yanıt vermedi. Daha sonra tekrar deneyin.";
        case DioExceptionType.badResponse:
          if (error.response?.statusCode == 400) {
            return "Lütfen tekrar deneyin.";
          } else if (error.response?.statusCode == 500) {
            return "Sunucuda bir hata oluştu. Lütfen daha sonra tekrar deneyin.";
          }
        default:
          return "Bir hata oluştu. Lütfen tekrar deneyin.";
      }
    }
    return "Bilinmeyen bir hata oluştu.";
  }
}
