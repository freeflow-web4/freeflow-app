import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _rootRouter = GetIt.I.get<RootRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _rootRouter.delegate(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      title: 'FreeFlow',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
