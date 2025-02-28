import 'package:book_app_intern_project/features/auth/data/auth_repository_impl.dart';
import 'package:book_app_intern_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:book_app_intern_project/features/home/data/home_repository_impl.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/home_repository.dart';

import '../../services/network/interceptors/auth_interceptors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../services/network/services.dart';

/// Dio provider.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
    },
  ));
  dio.interceptors.add(AuthInterceptor());
  return dio;
});

/// ApiService provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(ref.read(dioProvider));
});

/// AuthRepository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(apiServiceProvider));
});

/// HomeRepository Provider
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(apiService: ref.read(apiServiceProvider));
});
