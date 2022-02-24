import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/validators/field_validator.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  final UserRecoverLoginUseCase _userRecoverLoginUseCase;
  RecoverAccountControllerBase(this._userRecoverLoginUseCase);

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
      BuildContext context, String? privateKey, String? username) async {
    final result = await _userRecoverLoginUseCase(
      privateKey: privateKey ?? '',
      username: username ?? '',
    );
    result.fold(
      (left) {
        if (left == DomainError.requiredField) {
          privateKeyError = FlutterI18n.translate(
              context, 'recoverAccount.pleaseEnterYourPrivateKey');
        }
      },
      (right) => openDialog(context),
    );
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
