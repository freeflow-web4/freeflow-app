import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:freeflow/routes/root_router.gr.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  @observable
  bool showfirstViewFirstTextOpacity = false;

  @observable
  bool showfirstViewSecondTextOpacity = false;

  @observable
  bool showfirstViewTextFieldOpacity = false;

  @observable
  bool showContinueButton = false;

  @observable
  bool isContinueButtonActive = false;

  @observable
  bool isContinueButtonAnimating = true;

  @observable
  bool showFirstDotIndicator = false;

  @observable
  bool showSecondDotIndicator = false;

  @observable
  bool showThirdDotIndicator = false;

  @observable
  bool showCurrentIndexAnimation = false;

  @action
  void updateWidgetAnimations() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      showFirstDotIndicator = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      showSecondDotIndicator = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 3), (timer) {
      showThirdDotIndicator = true;
      showCurrentIndexAnimation = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {
      showfirstViewFirstTextOpacity = true;
      showCurrentIndexAnimation = false;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 6), (timer) {
      showfirstViewSecondTextOpacity = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 6), (timer) {
      showfirstViewTextFieldOpacity = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 9), (timer) {
      showContinueButton = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 10), (timer) {
      isContinueButtonAnimating = false;
      timer.cancel();
    });
  }

  Future<Object?> openDialog(BuildContext context) async {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, animation1, animation2) {
        return const FullScreenAlertDialog(
          textKey: "recoverAccount.pleaseEnterRegisteredName",
        );
      },
    );
  }
}
