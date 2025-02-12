import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/repositories/login_repository_impl.dart';
import '../../features/auth/data/repositories/register_repository_impl.dart';
import '../../features/auth/domain/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../features/auth/domain/repositories/register_repository.dart';
import '../../services/network/services.dart';

/// Dio provider.
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Content-Type': 'application/json'},
  ));
});

/// ApiService provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(ref.read(dioProvider));
});

/// LoginRepository provider
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(ref.read(apiServiceProvider));
});

/// RegisterRepository provider
final registerRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepositoryImpl(ref.read(apiServiceProvider));
});
