import 'package:book_app_intern_project/features/home/data/datasources/book_cover_data_source.dart';
import 'package:book_app_intern_project/features/home/data/datasources/book_data_source.dart';
import 'package:book_app_intern_project/features/home/data/datasources/category_data_source.dart';
import 'package:book_app_intern_project/features/home/data/repositories/category_repository_impl.dart';
import 'package:book_app_intern_project/features/home/domain/repositories/book_cover_repository.dart';
import 'package:book_app_intern_project/services/network/interceptors/auth_interceptors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/repositories/login_repository_impl.dart';
import '../../features/auth/data/repositories/register_repository_impl.dart';
import '../../features/auth/domain/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../features/auth/domain/repositories/register_repository.dart';
import '../../features/home/data/repositories/book_cover_repository_impl.dart';
import '../../features/home/data/repositories/book_repository_imp.dart';
import '../../features/home/domain/repositories/book_repository.dart';
import '../../features/home/domain/repositories/category_repository.dart';
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

/// LoginRepository provider
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(ref.read(apiServiceProvider));
});

/// RegisterRepository provider
final registerRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepositoryImpl(ref.read(apiServiceProvider));
});

/// CategoriesRepository Provider (This is the same way that we can seperate CategoryDataSoruce but it is not necessary)
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(
      CategoryDataSource(ref.read(apiServiceProvider)));
});

/// BookRepository Provider
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return BookRepositoryImpl(BookDataSource(ref.read(apiServiceProvider)));
});

/// BookCoverRepository Provider
final bookCoverRepositoryProvider = Provider<BookCoverRepository>((ref) {
  return BookCoverRepositoryImpl(
      BookCoverDataSource(ref.read(apiServiceProvider)));
});
