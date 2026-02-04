import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/home/home_screen.dart';
import '../../features/receive/receive_screen.dart';
import '../../features/send/send_screen.dart';

part 'app_router.gr.dart';
part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: SendRoute.page),
    AutoRoute(page: ReceiveRoute.page),
  ];
}

@riverpod
AppRouter appRouter(Ref ref) {
  return AppRouter();
}
