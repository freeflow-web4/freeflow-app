import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  final UserRecoverLoginUseCase _userRecoverLoginUseCase;
  RecoverAccountControllerBase(this._userRecoverLoginUseCase);

  @observable
  bool showCurrentIndexAnimation = false;

  @observable
  bool isContinueButtonActive = false;

  @observable
  String? privateKeyError;

  @observable
  bool isInFirstView = true;

  @observable
  bool isInSecondView = false;

  @observable
  int currentIndex = 0;

  int animationDuration = 10;

  @action
  void updateWidgetAnimations() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      showCurrentIndexAnimation = true;
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 4), (timer) {
      showCurrentIndexAnimation = false;
      timer.cancel();
    });
  }

  @action
  tapContinueButton(
      BuildContext context, String? privateKey, String? username) async {
    if (isInFirstView) {
      if ((username ?? '').isEmpty) {
        openDialog(context);
      } else {
        //TODO: Validate private key with API
        updateIndex(1);
      }
    } else {
      if ((privateKey ?? '').isEmpty) {
        openDialog(context);
      } else {
        final result = await _userRecoverLoginUseCase(
          privateKey: privateKey ?? '',
          username: username ?? '',
        );
        result.fold(
          (left) {
            if (left == DomainError.requiredField) {
              privateKeyError = currentIndex == 0
                  ? FlutterI18n.translate(
                      context, 'recoverAccount.pleaseEnterYourRegisteredName')
                  : currentIndex == 1
                      ? FlutterI18n.translate(
                          context, 'recoverAccount.pleaseEnterYourPrivateKey')
                      : FlutterI18n.translate(
                          context, 'recoverAccount.pleaseEnterYourPrivateKey');
            }
          },
          (right) => openDialog(context),
        );
      }
    }
  }

  @action
  void onChangedField({String? username, String? privateKey}) {
    if (isInFirstView) {
      if ((username ?? '').isEmpty) {
        isContinueButtonActive = false;
      } else {
        isContinueButtonActive = true;
      }
    } else if (isInSecondView) {
      if ((privateKey ?? '').isEmpty) {
        isContinueButtonActive = false;
      } else {
        isContinueButtonActive = true;
      }
    } else {
      if ((username ?? '').isEmpty) {
        isContinueButtonActive = false;
      } else {
        isContinueButtonActive = true;
      }
    }
  }

  Future<Object?> openDialog(BuildContext context) async {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, animation1, animation2) {
        return FullScreenAlertDialog(
          textKey: currentIndex == 0
              ? FlutterI18n.translate(
                  context, 'recoverAccount.pleaseEnterYourRegisteredName')
              : currentIndex == 1
                  ? FlutterI18n.translate(
                      context, 'recoverAccount.pleaseEnterYourPrivateKey')
                  : FlutterI18n.translate(
                      context, 'recoverAccount.pleaseEnterYourPrivateKey'),
        );
      },
    );
  }

  @action
  void updateIndex(int index) {
    if (index == 0) {
      if (isInFirstView) {
        return;
      } else {
        isInFirstView = true;
        isInSecondView = false;
        currentIndex = 0;
        animationDuration = 5;
        isContinueButtonActive = false;
      }
    } else if (index == 1) {
      if (isInSecondView) {
        return;
      } else {
        isInFirstView = false;
        isInSecondView = true;
        currentIndex = 1;
        isContinueButtonActive = false;
      }
    }
  }

  void openKeyboard(context, {required FocusNode inputNode, int? duration}) {
    Timer.periodic(Duration(seconds: duration ?? animationDuration), (timer) {
      FocusScope.of(context).requestFocus(inputNode);
    });
  }
}
