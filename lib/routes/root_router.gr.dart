// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../layers/presentation/pages/auth/auth_page.dart' as _i6;
import '../layers/presentation/pages/create_wallet/create_wallet_page.dart'
    as _i8;
import '../layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart'
    as _i4;
import '../layers/presentation/pages/home/home_page.dart' as _i7;
import '../layers/presentation/pages/login/login_page.dart' as _i2;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i5;
import '../layers/presentation/pages/recover_splash/recover_splash_page.dart'
    as _i9;
import '../layers/presentation/pages/splash/splash_page.dart' as _i3;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i1;

class RootRouter extends _i10.RootStackRouter {
  RootRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomePage());
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashPage());
    },
    FreeflowLogoLoadingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FreeflowLogoLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RecoverAccountPage());
    },
    AuthRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AuthPage());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    },
    CreateWalletRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CreateWalletPage());
    },
    RecoverSplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RecoverSplashPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i10.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i10.RouteConfig(SplashRoute.name, path: '/'),
        _i10.RouteConfig(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page'),
        _i10.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i10.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i10.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i10.RouteConfig(CreateWalletRoute.name, path: '/create-wallet-page'),
        _i10.RouteConfig(RecoverSplashRoute.name, path: '/recover-splash-page')
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i4.FreeflowLogoLoadingPage]
class FreeflowLogoLoadingRoute extends _i10.PageRouteInfo<void> {
  const FreeflowLogoLoadingRoute()
      : super(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page');

  static const String name = 'FreeflowLogoLoadingRoute';
}

/// generated route for
/// [_i5.RecoverAccountPage]
class RecoverAccountRoute extends _i10.PageRouteInfo<void> {
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
/// [_i6.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.CreateWalletPage]
class CreateWalletRoute extends _i10.PageRouteInfo<void> {
  const CreateWalletRoute()
      : super(CreateWalletRoute.name, path: '/create-wallet-page');

  static const String name = 'CreateWalletRoute';
}

/// generated route for
/// [_i9.RecoverSplashPage]
class RecoverSplashRoute extends _i10.PageRouteInfo<void> {
  const RecoverSplashRoute()
      : super(RecoverSplashRoute.name, path: '/recover-splash-page');

  static const String name = 'RecoverSplashRoute';
}
