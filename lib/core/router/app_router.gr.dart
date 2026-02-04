// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
/// [ReceiveScreen]
class ReceiveRoute extends PageRouteInfo<void> {
  const ReceiveRoute({List<PageRouteInfo>? children})
    : super(ReceiveRoute.name, initialChildren: children);

  static const String name = 'ReceiveRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReceiveScreen();
    },
  );
}

/// generated route for
/// [SendScreen]
class SendRoute extends PageRouteInfo<void> {
  const SendRoute({List<PageRouteInfo>? children})
    : super(SendRoute.name, initialChildren: children);

  static const String name = 'SendRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SendScreen();
    },
  );
}
