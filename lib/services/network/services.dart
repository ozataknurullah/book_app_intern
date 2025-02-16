import 'package:dio/dio.dart';

import '../../core/utils/error_mapper.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  /// GET Method
  Future<dynamic> get(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);

      return response.data;
    } catch (e) {
      throw Exception(ErrorMapper.getErrorMessage(e));
    }
  }

  ///POST Method
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response.data;
    } catch (e) {
      throw Exception(ErrorMapper.getErrorMessage(e));
    }
  }

  ///PUT (update) Method
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return response.data;
    } catch (e) {
      throw Exception(ErrorMapper.getErrorMessage(e));
    }
  }

  ///DELETE Method
  Future<dynamic> delete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response.data;
    } catch (e) {
      throw Exception(ErrorMapper.getErrorMessage(e));
    }
  }
}
