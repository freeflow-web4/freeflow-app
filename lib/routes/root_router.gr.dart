// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../layers/presentation/pages/auth/auth_page.dart' as _i5;
import '../layers/presentation/pages/login/login_page.dart' as _i2;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i4;
import '../layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart'
    as _i3;
import '../layers/presentation/pages/splash/splash_page.dart' as _i1;

class RootRouter extends _i6.RootStackRouter {
  RootRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RecoverAccountLoadingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RecoverAccountLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RecoverAccountPage());
    },
    AuthRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AuthPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i6.RouteConfig(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page'),
        _i6.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i6.RouteConfig(AuthRoute.name, path: '/auth-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RecoverAccountLoadingPage]
class RecoverAccountLoadingRoute extends _i6.PageRouteInfo<void> {
  const RecoverAccountLoadingRoute()
      : super(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page');

  static const String name = 'RecoverAccountLoadingRoute';
}

/// generated route for
/// [_i4.RecoverAccountPage]
class RecoverAccountRoute extends _i6.PageRouteInfo<void> {
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
/// [_i5.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}
