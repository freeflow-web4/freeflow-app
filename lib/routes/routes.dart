import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class Routes {
  final RouteService _routeService;

  Routes(this._routeService);

  static get instance => GetIt.I.get<Routes>();

  void goToRecoverAccountPageRoute(BuildContext context) async {
    _routeService.pushReplacement(context, const RecoverAccountRoute());
  }

  void goToWelcomePageRoute(BuildContext context) async {
    _routeService.pushReplacement(context, const WelcomeRoute());
  }

  void pop(BuildContext context) {
    _routeService.pop(context);
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

class ProfileRoute {}

class Failure {}

class ProfileRouteRequest {}

class ProfileRouteResponse {}
