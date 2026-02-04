import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class AirdropApp extends ConsumerWidget {
  const AirdropApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch router provider (to be created)
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Airdrop Flutter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
