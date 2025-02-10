import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/login_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/register_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/splash_screen.dart';
import 'package:book_app_intern_project/features/home/domain/models/book_model.dart';
import 'package:book_app_intern_project/features/home/presentation/pages/book_detail_screen.dart';
import 'package:book_app_intern_project/features/home/presentation/pages/category_screen.dart';
import 'package:book_app_intern_project/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: BookDetailRoute.page),
      ];
}
