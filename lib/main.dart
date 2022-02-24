import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:freeflow/app_widget.dart';
import 'package:freeflow/core/inject/injection_container.dart';
import 'package:freeflow/layers/infra/route/auto_route_handler.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

Future<void> main() async {
  Inject.init();
  await dotenv.load(fileName: '.env');

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      decodeStrategies: [JsonDecodeStrategy()],
      useCountryCode: false,
      basePath: 'assets/i18n',
    ),
  );

  final routeHandler = AutoRouteHandler();
  final routes = Routes(RouteService(routeHandler));
  GetIt.I.registerSingleton<Routes>(routes);
  GetIt.I.registerSingleton<RootRouter>(RootRouter());
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) =>
          MyApp(flutterI18nDelegate: flutterI18nDelegate), // Wrap your app
    ),
  );
}
