// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../layers/presentation/pages/auth/auth_page.dart' as _i10;
import '../layers/presentation/pages/cut_image/cut_image_page.dart' as _i2;
import '../layers/presentation/pages/edit_profile/edit_profile_page.dart'
    as _i3;
import '../layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart'
    as _i8;
import '../layers/presentation/pages/home/home_page.dart' as _i1;
import '../layers/presentation/pages/login/login_page.dart' as _i6;
import '../layers/presentation/pages/profile/profile_page.dart' as _i5;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i9;
import '../layers/presentation/pages/recover_splash/recover_splash_page.dart'
    as _i12;
import '../layers/presentation/pages/splash/splash_page.dart' as _i7;
import '../layers/presentation/pages/wallet/wallet_page.dart' as _i11;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i4;

class RootRouter extends _i13.RootStackRouter {
  RootRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    CutImageRoute.name: (routeData) {
      final args = routeData.argsAs<CutImageRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CutImagePage(key: args.key, imageUrl: args.imageUrl));
    },
    EditProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EditProfilePage());
    },
    WelcomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.WelcomePage());
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LoginPage());
    },
    SplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SplashPage());
    },
    FreeflowLogoLoadingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FreeflowLogoLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RecoverAccountPage());
    },
    AuthRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AuthPage());
    },
    WalletRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.WalletPage());
    },
    RecoverSplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.RecoverSplashPage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i13.RouteConfig(CutImageRoute.name, path: '/cut-image-page'),
        _i13.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i13.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i13.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i13.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i13.RouteConfig(SplashRoute.name, path: '/'),
        _i13.RouteConfig(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page'),
        _i13.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i13.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i13.RouteConfig(WalletRoute.name, path: '/wallet-page'),
        _i13.RouteConfig(RecoverSplashRoute.name, path: '/recover-splash-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CutImagePage]
class CutImageRoute extends _i13.PageRouteInfo<CutImageRouteArgs> {
  CutImageRoute({_i14.Key? key, required String imageUrl})
      : super(CutImageRoute.name,
            path: '/cut-image-page',
            args: CutImageRouteArgs(key: key, imageUrl: imageUrl));

  static const String name = 'CutImageRoute';
}

class CutImageRouteArgs {
  const CutImageRouteArgs({this.key, required this.imageUrl});

  final _i14.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'CutImageRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i3.EditProfilePage]
class EditProfileRoute extends _i13.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-page');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i4.WelcomePage]
class WelcomeRoute extends _i13.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i8.FreeflowLogoLoadingPage]
class FreeflowLogoLoadingRoute extends _i13.PageRouteInfo<void> {
  const FreeflowLogoLoadingRoute()
      : super(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page');

  static const String name = 'FreeflowLogoLoadingRoute';
}

/// generated route for
/// [_i9.RecoverAccountPage]
class RecoverAccountRoute extends _i13.PageRouteInfo<void> {
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
/// [_i10.AuthPage]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i11.WalletPage]
class WalletRoute extends _i13.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: '/wallet-page');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i12.RecoverSplashPage]
class RecoverSplashRoute extends _i13.PageRouteInfo<void> {
  const RecoverSplashRoute()
      : super(RecoverSplashRoute.name, path: '/recover-splash-page');

  static const String name = 'RecoverSplashRoute';
}
