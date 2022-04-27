import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:freeflow/layers/presentation/helpers/show_flex_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/pages/logout/pages/auth/logout_auth_page.dart';
import 'package:freeflow/layers/presentation/pages/logout/pages/confirm/logout_confirm_page.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class Routes with TextThemes {
  final RouteService _routeService;

  Routes(this._routeService);

  static Routes get instance => GetIt.I.get<Routes>();

  void goToRecoverAccountPageRoute() {
    _routeService.pushReplacement(const RecoverAccountRoute());
  }

  void goToWelcomeBackPageRoute() async {
    _routeService.pushReplacement(const WelcomeBackRoute());
  }

  void goToWelcomePageRoute() async {
    _routeService.pushReplacement(const WelcomeRoute());
  }

  void goToSplashRecoverRoute(void Function() onAnimationend) async {
    _routeService.pushReplacement(
      WhiteSplashRoute(
        onAnimationEnd: onAnimationend,
      ),
    );
  }

  Future<void> goToFreeflowLogoLoadingRoute(
    void Function() onLoadingCompleted,
  ) {
    return _routeService.pushReplacement(
      FreeflowLogoLoadingRoute(
        onLoadingCompleted: onLoadingCompleted,
      ),
    );
  }

  void goToLoginPageRoute() {
    _routeService.pushReplacement(const LoginRoute());
  }

  Future<void> goToAuthPageRoute() {
    return _routeService.push(const AuthRoute());
  }

  void goToHomePageRoute() {
    _routeService.pushReplacement(const HomeRoute());
  }

  void goToCreateWalletPageRoute() {
    _routeService.pushReplacement(const CreateWalletRoute());
  }

  void goToProfilePageRoute() {
    _routeService.push(const ProfileRoute());
  }

  void goToWalletPageRoute() {
    _routeService.pushReplacement(const WalletRoute());
  }

  Future<ProfileEntity?> goToEditProfilePageRoute(
    ProfileEntity profileEntity,
  ) async {
    final RouteResponse? response =
        await _routeService.push(EditProfileRoute(user: profileEntity));
    return response?.body;
  }

  Future<Uint8List?> goToCutImagePageRoute(String imageUrl) async {
    final RouteResponse? response =
        await _routeService.push(CutImageRoute(imageUrl: imageUrl));
    return response?.body;
  }

  void pop({RouteResponse<dynamic>? data}) {
    _routeService.pop(data: data);
  }

  void backToEditProfile(Uint8List file) {
    RouteResponse data = RouteResponse(body: file);
    _routeService.pop(data: data);
  }

  void backToProfile(ProfileEntity? profileEntity) {
    RouteResponse data = RouteResponse(body: profileEntity);
    _routeService.pop(data: data);
  }

  void goToLogout(
    BuildContext context,
  ) async {
    final authResult = await showFlexBottomSheet(
      context,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textH6(
            context,
            textKey: 'logout.authTitle',
            isUpperCase: true,
          ),
        ],
      ),
      const LogoutAuthPage(),
    );
    if (!(authResult == true) && false) {
      return;
    }
    final confirmResult = await showFlexBottomSheet(
      context,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textH6(
            context,
            textKey: 'logout.confirmTitle',
            isUpperCase: true,
          ),
        ],
      ),
      const LogoutConfirmPage(),
    );
    if (confirmResult == false) {
      return;
    }
    //TODO: make the logout usecase
  }
}
