// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i2;
import '../layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart'
    as _i1;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i3;

class RootRouter extends _i4.RootStackRouter {
  RootRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RecoverAccountLoadingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecoverAccountLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RecoverAccountPage());
    },
    WelcomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WelcomePage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(RecoverAccountLoadingRoute.name, path: '/'),
        _i4.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i4.RouteConfig(WelcomeRoute.name, path: '/welcome-page')
      ];
}

/// generated route for
/// [_i1.RecoverAccountLoadingPage]
class RecoverAccountLoadingRoute extends _i4.PageRouteInfo<void> {
  const RecoverAccountLoadingRoute()
      : super(RecoverAccountLoadingRoute.name, path: '/');

  static const String name = 'RecoverAccountLoadingRoute';
}

/// generated route for
/// [_i2.RecoverAccountPage]
class RecoverAccountRoute extends _i4.PageRouteInfo<void> {
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
/// [_i3.WelcomePage]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}
