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

  Future<RouteResponse?> pushNamed(BuildContext context, String path, {data}) async {
    onRouteChange?.call();
    return routeHandler.pushNamed(context, path, data: data);
  }
  
  Future<bool> canPop(BuildContext context) {
    return routeHandler.canPop(context);
  }

  Future<RouteResponse?> pop(BuildContext context,
      {RouteResponse? data}) async {
    final canPop = await routeHandler.canPop(context);
    if (!canPop) return null;
    onRouteChange?.call();
    return routeHandler.pop(context, data: data);
  }

}
