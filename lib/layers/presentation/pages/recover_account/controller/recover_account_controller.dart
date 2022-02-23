import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/layers/presentation/helpers/validators/field_validator.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  final FieldValidator fieldValidator;
  RecoverAccountControllerBase({required this.fieldValidator});

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

  @observable
  String? privateKeyError;

  @observable
  bool isInFirstView = true;

  @action
  void validatePrivateKey(BuildContext context, String? privateKey) {
    final error = fieldValidator.validateRequiredField(privateKey ?? '');
    if (error != null) {
      privateKeyError = FlutterI18n.translate(
        context,
        "recoverAccount.pleaseEnterYourPrivateKey",
      );
    } else {
      privateKeyError = null;
    }
  }

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

  @action
  tapContinueButton(
      BuildContext context, String? privateKey, String? username) {
    validatePrivateKey(context, privateKey);
    if (isInFirstView) {
      if (privateKeyError == null) {
        isInFirstView = false;
        return;
      } else {
        openDialog(context);
      }
    } else {}
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
