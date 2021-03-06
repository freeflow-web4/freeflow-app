import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;
  MyApp({Key? key, required this.flutterI18nDelegate}) : super(key: key);

  final _rootRouter = GetIt.I.get<RootRouter>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp.router(
      routerDelegate: _rootRouter.delegate(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      title: 'FreeFlow',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, widget) {
        final double screenHeight = MediaQuery.of(context).size.height;
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          minWidth: 480,
          defaultScale: screenHeight < 680,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
          ],
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [flutterI18nDelegate],
    );
  }
}
