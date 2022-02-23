import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';

part 'fullscreen_alert_dialog_controller.g.dart';

class FullscreenAlertDialogController = FullscreenAlertDialogControllerBase
    with _$FullscreenAlertDialogController;

abstract class FullscreenAlertDialogControllerBase with Store {
  @observable
  bool showCloseButton = false;

  @observable
  bool isCloseButtonAnimating = false;

  @action
  void updateWidgetAnimations() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      showCloseButton = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      isCloseButtonAnimating = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 3), (timer) {
      isCloseButtonAnimating = false;
      timer.cancel();
    });
  }

  Future<void> closeDialog(BuildContext context) async =>
      Routes.instance.pop(context);
}
