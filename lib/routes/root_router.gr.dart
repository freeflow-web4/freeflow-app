// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../layers/presentation/pages/auth/auth_page.dart' as _i7;
import '../layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart'
    as _i5;
import '../layers/presentation/pages/home/home_page.dart' as _i8;
import '../layers/presentation/pages/login/login_page.dart' as _i3;
import '../layers/presentation/pages/profile/profile_page.dart' as _i2;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i6;
import '../layers/presentation/pages/recover_splash/recover_splash_page.dart'
    as _i9;
import '../layers/presentation/pages/splash/splash_page.dart' as _i4;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i1;

class RootRouter extends _i10.RootStackRouter {
  RootRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomePage());
=======
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../layers/presentation/pages/auth/auth_page.dart' as _i8;
import '../layers/presentation/pages/cut_image/cut_image_page.dart' as _i1;
import '../layers/presentation/pages/edit_profile/edit_profile_page.dart'
    as _i2;
import '../layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart'
    as _i6;
import '../layers/presentation/pages/home/home_page.dart' as _i9;
import '../layers/presentation/pages/login/login_page.dart' as _i4;
import '../layers/presentation/pages/recover_account/recover_account_page.dart'
    as _i7;
import '../layers/presentation/pages/recover_splash/recover_splash_page.dart'
    as _i10;
import '../layers/presentation/pages/splash/splash_page.dart' as _i5;
import '../layers/presentation/pages/welcome/welcome_page.dart' as _i3;

class RootRouter extends _i11.RootStackRouter {
  RootRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CutImageRoute.name: (routeData) {
      final args = routeData.argsAs<CutImageRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.CutImagePage(key: args.key, imageUrl: args.imageUrl));
    },
    EditProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EditProfilePage());
    },
    WelcomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WelcomePage());
>>>>>>> origin
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfilePage());
    },
    LoginRoute.name: (routeData) {
<<<<<<< HEAD
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    SplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SplashPage());
    },
    FreeflowLogoLoadingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.FreeflowLogoLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.RecoverAccountPage());
    },
    AuthRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthPage());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomePage());
    },
    RecoverSplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RecoverSplashPage());
=======
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SplashPage());
    },
    FreeflowLogoLoadingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.FreeflowLogoLoadingPage());
    },
    RecoverAccountRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RecoverAccountPage());
    },
    AuthRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AuthPage());
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomePage());
    },
    RecoverSplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.RecoverSplashPage());
>>>>>>> origin
    }
  };

  @override
<<<<<<< HEAD
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i10.RouteConfig(ProfileRoute.name, path: '/'),
        _i10.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i10.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i10.RouteConfig(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page'),
        _i10.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i10.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i10.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i10.RouteConfig(RecoverSplashRoute.name, path: '/recover-splash-page')
=======
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(CutImageRoute.name, path: '/cut-image-page'),
        _i11.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i11.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i11.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i11.RouteConfig(SplashRoute.name, path: '/'),
        _i11.RouteConfig(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page'),
        _i11.RouteConfig(RecoverAccountRoute.name,
            path: '/recover-account-page'),
        _i11.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i11.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i11.RouteConfig(RecoverSplashRoute.name, path: '/recover-splash-page')
>>>>>>> origin
      ];
}

/// generated route for
<<<<<<< HEAD
/// [_i1.WelcomePage]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i1.CutImagePage]
class CutImageRoute extends _i11.PageRouteInfo<CutImageRouteArgs> {
  CutImageRoute({_i12.Key? key, required String imageUrl})
      : super(CutImageRoute.name,
            path: '/cut-image-page',
            args: CutImageRouteArgs(key: key, imageUrl: imageUrl));

  static const String name = 'CutImageRoute';
}

class CutImageRouteArgs {
  const CutImageRouteArgs({this.key, required this.imageUrl});

  final _i12.Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'CutImageRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i2.EditProfilePage]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-page');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i3.WelcomePage]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i2.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i4.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i4.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');
=======
/// [_i5.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');
>>>>>>> origin

  static const String name = 'SplashRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i5.FreeflowLogoLoadingPage]
class FreeflowLogoLoadingRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i6.FreeflowLogoLoadingPage]
class FreeflowLogoLoadingRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const FreeflowLogoLoadingRoute()
      : super(FreeflowLogoLoadingRoute.name,
            path: '/freeflow-logo-loading-page');

  static const String name = 'FreeflowLogoLoadingRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i6.RecoverAccountPage]
class RecoverAccountRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i7.RecoverAccountPage]
class RecoverAccountRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const RecoverAccountRoute()
      : super(RecoverAccountRoute.name, path: '/recover-account-page');

  static const String name = 'RecoverAccountRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i7.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i8.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i8.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i9.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i9.RecoverSplashPage]
class RecoverSplashRoute extends _i10.PageRouteInfo<void> {
=======
/// [_i10.RecoverSplashPage]
class RecoverSplashRoute extends _i11.PageRouteInfo<void> {
>>>>>>> origin
  const RecoverSplashRoute()
      : super(RecoverSplashRoute.name, path: '/recover-splash-page');

  static const String name = 'RecoverSplashRoute';
}
