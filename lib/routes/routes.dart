import 'dart:typed_data';

import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class Routes {
  final RouteService _routeService;

  Routes(this._routeService);

  static Routes get instance => GetIt.I.get<Routes>();

  void goToRecoverAccountPageRoute() {
    _routeService.pushReplacement(const RecoverAccountRoute());
  }

  void goToWelcomePageRoute() async {
    _routeService.pushReplacement(const WelcomeRoute());
  }

  void goToSplashRecoverRoute() async {
    _routeService.pushReplacement(const RecoverSplashRoute());
  }

  void goToFreeflowLogoLoadingRoute() {
    _routeService.pushReplacement(const FreeflowLogoLoadingRoute());
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

  void goToProfilePageRoute() {
    _routeService.push(const ProfileRoute());
  }

  void goToWalletPageRoute() {
    _routeService.pushReplacement(const WalletRoute());
  }

  Future<ProfileEntity?> goToEditProfilePageRoute(ProfileEntity profileEntity) async {
    final RouteResponse? response = await _routeService.push( EditProfileRoute(user: profileEntity));
    return response?.body;
  }

  Future<Uint8List?> goToCutImagePageRoute(String imageUrl) async {
    final RouteResponse? response =
        await _routeService.push(CutImageRoute(imageUrl: imageUrl));
    return response?.body;
  }

  void pop() {
    _routeService.pop();
  }

  void backToEditProfile(Uint8List file) {
    RouteResponse data = RouteResponse(body: file);
    _routeService.pop(data: data);
  }

  void backToProfile(ProfileEntity? profileEntity) {
    RouteResponse data = RouteResponse(body: profileEntity);
    _routeService.pop(data: data);
  }

//   Future<Either<Failure, ProfileRouteResponse>> goToProfilePageRoute(
//       BuildContext context, ProfileRouteRequest request) async {
//     final routeServiceResponse =
//         await _routeService.push(context, ProfileRoute());
//     if (routeServiceResponse == null) return Left(Failure());
//     final routeResponse = routeServiceResponse.body as ProfileRouteResponse;
//     return Right(routeResponse);
//   }

//   Future<Either<Failure, ProfileRouteResponse>> goBackFromProfilePageRoute(
//       BuildContext context, ProfileRouteResponse response) async {
//     final routeServiceResponse = await _routeService
//         .pop(context, data: RouteResponse(body: response));
//     if (routeServiceResponse == null) return Left(Failure());
//     final routeResponse = routeServiceResponse.body as ProfileRouteResponse;
//     return Right(routeResponse);
//   }
}
