import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/login_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/register_screen.dart';
import 'package:book_app_intern_project/features/auth/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
      ];
}
