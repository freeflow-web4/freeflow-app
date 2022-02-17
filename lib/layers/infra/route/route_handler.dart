import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';

abstract class RouteHandler {
  Future<String> getCurrentRoutePath(BuildContext context);
  Future<RouteResponse?> pushNamed(BuildContext context, String path, {data});
  Future<bool> canPop(BuildContext context);
  Future<RouteResponse?> pop(BuildContext context, {RouteResponse? data});
}
