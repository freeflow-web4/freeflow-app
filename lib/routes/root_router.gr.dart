// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i2;
import '../layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart'
    as _i1;

class RootRouter extends _i3.RootStackRouter {
  RootRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RecoverAccountLoadingRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecoverAccountLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RecoverAccountPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page'),
        _i3.RouteConfig(RecoverAccountRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.RecoverAccountLoadingPage]
class RecoverAccountLoadingRoute extends _i3.PageRouteInfo<void> {
  const RecoverAccountLoadingRoute()
      : super(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page');

  static const String name = 'RecoverAccountLoadingRoute';
}

/// generated route for
/// [_i2.RecoverAccountPage]
class RecoverAccountRoute extends _i3.PageRouteInfo<void> {
  const RecoverAccountRoute() : super(RecoverAccountRoute.name, path: '/');

  static const String name = 'RecoverAccountRoute';
}
