import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';

abstract class RouteHandler {
  Future<String> getCurrentRoutePath(BuildContext context);
  Future<RouteResponse?> push(BuildContext context, routeSettings);
  Future<void> pushReplacement(BuildContext context, routeSettings);
  bool canPop(BuildContext context);
  Future<bool> pop(BuildContext context, {RouteResponse? data});
}
