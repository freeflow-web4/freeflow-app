import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freeflow/app_widget.dart';
import 'package:freeflow/core/inject/inject.dart';

Future<void> main() async {
  Inject.init();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}
