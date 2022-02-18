import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freeflow/app_widget.dart';
import 'package:freeflow/core/inject/injection_container.dart';

Future<void> main() async {
  Inject.init();
  await dotenv.load(fileName: '.env');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
