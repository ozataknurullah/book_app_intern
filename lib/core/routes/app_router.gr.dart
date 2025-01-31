// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BookDetailScreen]
class BookDetailRoute extends PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({
    Key? key,
    required String bookId,
    List<PageRouteInfo>? children,
  }) : super(
         BookDetailRoute.name,
         args: BookDetailRouteArgs(key: key, bookId: bookId),
         initialChildren: children,
       );

  static const String name = 'BookDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailRouteArgs>();
      return BookDetailScreen(key: args.key, bookId: args.bookId);
    },
  );
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({this.key, required this.bookId});

  final Key? key;

  final String bookId;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, bookId: $bookId}';
  }
}

/// generated route for
/// [CategoryScreen]
class CategoryRoute extends PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    Key? key,
    required String categoryTitle,
    required List<BookModel> books,
    List<PageRouteInfo>? children,
  }) : super(
         CategoryRoute.name,
         args: CategoryRouteArgs(
           key: key,
           categoryTitle: categoryTitle,
           books: books,
         ),
         initialChildren: children,
       );

  static const String name = 'CategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryRouteArgs>();
      return CategoryScreen(
        key: args.key,
        categoryTitle: args.categoryTitle,
        books: args.books,
      );
    },
  );
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.categoryTitle,
    required this.books,
  });

  final Key? key;

  final String categoryTitle;

  final List<BookModel> books;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryTitle: $categoryTitle, books: $books}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        RegisterRoute.name,
        args: RegisterRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
        orElse: () => const RegisterRouteArgs(),
      );
      return RegisterScreen(key: args.key);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
