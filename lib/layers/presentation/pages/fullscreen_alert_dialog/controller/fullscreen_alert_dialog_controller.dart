import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/routes/routes.dart';

class FullscreenAlertDialogController {
  Future<void> closeDialog(BuildContext context) async =>
      Routes.instance.pop(context);
}
