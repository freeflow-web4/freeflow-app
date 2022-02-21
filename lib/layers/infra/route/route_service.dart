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
      BuildContext context, PageRouteInfo routeSettings) async {
    onRouteChange?.call();
    return routeHandler.push(context, routeSettings);
  }

  Future<void> pushReplacement(
      BuildContext context, PageRouteInfo routeSettings) async {
    onRouteChange?.call();
    return routeHandler.pushReplacement(context, routeSettings);
  }

  bool canPop(BuildContext context) {
    return routeHandler.canPop(context);
  }

  Future<bool> pop(BuildContext context, {RouteResponse? data}) async {
    final canPop = routeHandler.canPop(context);
    if (!canPop) return false;
    onRouteChange?.call();
    return routeHandler.pop(context, data: data);
  }
}
