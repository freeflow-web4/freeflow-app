import 'dart:async';
import 'package:freeflow/routes/routes.dart';

class FullscreenAlertDialogController {
  Future<void> closeDialog() async =>
      Routes.instance.pop();
}
