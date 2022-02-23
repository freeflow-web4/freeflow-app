import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_handler.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class AutoRouteHandler implements RouteHandler {
  @override
  bool canPop(BuildContext context) {
    final router = context.router;
    return router.canPopSelfOrChildren;
  }

  @override
  Future<String> getCurrentRoutePath(BuildContext context) {
    // TODO: implement getCurrentRoutePath
    throw UnimplementedError();
  }

  @override
  Future<bool> pop(BuildContext context, {RouteResponse? data}) async {
    final router = context.router;
    return router.pop(data);
  }

  @override
  Future<RouteResponse?> push(context, routeSettings) async {
    final router = context.router;
    final response = await router.push(routeSettings);
    return response as RouteResponse;
  }

  @override
  Future<void> pushReplacement(routeSettings) async{
    final router = GetIt.I.get<RootRouter>();
    await router.replace(routeSettings);
  }
}
