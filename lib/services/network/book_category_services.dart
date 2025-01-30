import 'package:dio/dio.dart';

class CategoryService {
  final Dio dio;

  CategoryService(this.dio);

  Future<List<dynamic>> fetchCategories() async {
    try {
      final response =
          await dio.get('https://assign-api.piton.com.tr/api/rest/categories');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
