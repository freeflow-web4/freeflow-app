import 'package:flutter/material.dart';
import 'package:freeflow/app_widget.dart';
import 'package:freeflow/core/inject/inject.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}
