import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';

abstract class RouteHandler {
  Future<String> getCurrentRoutePath(BuildContext context);
  Future<RouteResponse?> push(routeSettings);
  Future<void> pushReplacement(routeSettings);
  bool canPop(BuildContext context);
  Future<bool> pop(BuildContext context, {RouteResponse? data});
}
