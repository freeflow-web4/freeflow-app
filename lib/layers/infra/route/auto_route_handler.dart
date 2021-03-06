import 'package:flutter/material.dart';
import 'package:freeflow/layers/infra/route/route_handler.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class AutoRouteHandler implements RouteHandler {
  @override
  bool canPop() {
    final router = GetIt.I.get<RootRouter>();
    return router.canPopSelfOrChildren;
  }

  @override
  Future<String> getCurrentRoutePath(BuildContext context) {
    // TODO: implement getCurrentRoutePath
    throw UnimplementedError();
  }

  @override
  Future<bool> pop({RouteResponse? data}) async {
    final router = GetIt.I.get<RootRouter>();
    return router.pop(data);
  }

  @override
  Future<RouteResponse?> push(routeSettings) async {
    final router = GetIt.I.get<RootRouter>();
    final response = await router.push(routeSettings);
    return response as RouteResponse?;
  }

  @override
  Future<void> pushReplacement(routeSettings) async {
    final router = GetIt.I.get<RootRouter>();
    await router.replace(routeSettings);
  }

  @override
  Future<bool> pushAndPopAll(routeSettings) async {
    final router = GetIt.I.get<RootRouter>();
    try {
      await router.pushAndPopUntil(routeSettings, predicate: (_) => false);
      return true;
    } catch (e) {
      return false;
    }
  }
}
