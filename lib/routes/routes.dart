import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class Routes {
  final RouteService _routeService;

  Routes(this._routeService);

  static Routes get instance => GetIt.I.get<Routes>();

  void goToRecoverAccountPageRoute()  {
    _routeService.pushReplacement(const RecoverAccountRoute());
  }

  void goToLoginPageRoute()  {
    _routeService.pushReplacement(const LoginRoute());
  }

  void goToAuthPageRoute() {
    _routeService.push(const AuthRoute());
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
