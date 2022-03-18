// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../layers/presentation/pages/auth/auth_page.dart' as _i6;
import '../layers/presentation/pages/home/home_page.dart' as _i7;
import '../layers/presentation/pages/login/login_page.dart' as _i5;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i2;
import '../layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart'
    as _i1;
import '../layers/presentation/pages/splash/splash_page.dart' as _i4;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i3;

class RootRouter extends _i8.RootStackRouter {
  RootRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    RecoverAccountLoadingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecoverAccountLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RecoverAccountPage());
    },
    WelcomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WelcomePage());
    },
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginPage());
    },
    AuthRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AuthPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page'),
        _i8.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i8.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page'),
        _i8.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i8.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.RecoverAccountLoadingPage]
class RecoverAccountLoadingRoute extends _i8.PageRouteInfo<void> {
  const RecoverAccountLoadingRoute()
      : super(RecoverAccountLoadingRoute.name,
            path: '/recover-account-loading-page');

  static const String name = 'RecoverAccountLoadingRoute';
}

/// generated route for
/// [_i2.RecoverAccountPage]
class RecoverAccountRoute extends _i8.PageRouteInfo<void> {
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
/// [_i3.WelcomePage]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i6.AuthPage]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}
