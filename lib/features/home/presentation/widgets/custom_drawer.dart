import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/features/auth/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/providers/providers.dart';
import '../../../../core/utils/auth_token.dart';
import '../../../../services/local/local_stroge.dart';
import '../providers/fav_provider.dart';
import '../providers/user_provider.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_theme.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _BuildHeader(),
            _BuildMenuItems(),
          ],
        ),
      ),
    );
  }
}

class _BuildHeader extends ConsumerWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameAsync = ref.watch(userNameProvider);
    return Container(
      padding: EdgeInsets.only(top: 50.h),
      color: AppTheme.lightTheme.colorScheme.secondary,
      child: Column(
        children: [
          CircleAvatar(
            radius: 52.r,
          ),
          SizedBox(height: 10.h),
          userNameAsync.when(
            data: (email) => Text(
              email ?? "...",
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
            loading: () => Text(
              "Loading...",
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
            error: (error, stack) => Text(
              "Guest",
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class _BuildMenuItems extends ConsumerWidget {
  const _BuildMenuItems();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Wrap(
        runSpacing: 5.h,
        children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final router = context.router;
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
              if (shouldLogout == true) {
                // clear token in localStorge
                await LocalStroge.removeToken();
                // clear token in memory
                AuthToken.token = null;

                await DefaultCacheManager().emptyCache();

                router.replaceAll([const SplashRoute()]);
              }
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
