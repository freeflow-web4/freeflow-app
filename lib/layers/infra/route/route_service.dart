import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_handler.dart';

import 'route_response.dart';

/// Use to navigate in the application.
///
/// Such as: **push**, **pop**, **pushNamed**
///
/// Any **missing parameter** for usage that is found can be add to enhance the service
class RouteService {
  final RouteHandler routeHandler;
  final void Function()? onRouteChange;

  RouteService(this.routeHandler, {this.onRouteChange});

  Future<String> getCurrentRoutePath(BuildContext context) {
    return routeHandler.getCurrentRoutePath(context);
  }

  Future<RouteResponse?> push(
    PageRouteInfo routeSettings,
  ) async {
    onRouteChange?.call();
    return routeHandler.push(routeSettings);
  }

  Future<void> pushReplacement(PageRouteInfo routeSettings) async {
    onRouteChange?.call();
    return routeHandler.pushReplacement(routeSettings);
  }

  bool canPop() {
    return routeHandler.canPop();
  }

  Future<bool> pop({RouteResponse? data}) async {
    final canPop = routeHandler.canPop();
    if (!canPop) return false;
    onRouteChange?.call();
    return routeHandler.pop(data: data);
  }

  Future<bool> pushAndPopAll(PageRouteInfo routeSettings) async{
    onRouteChange?.call();
    return routeHandler.pushAndPopAll(routeSettings);
  }
}
