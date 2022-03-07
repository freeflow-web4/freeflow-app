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
  bool isContinueButtonActive = false;

  @observable
  bool isAnimatingExitFirstView = false;

  @observable
  bool isAnimatingExitSecondView = false;

  @observable
  bool isAnimatingExitThirdView = false;

  @observable
  bool isAnimatingExistFirstViewEnd = false;

  @observable
  bool isAnimatingExitSecondViewEnd = false;

  @observable
  bool isAnimatingExitThirdViewEnd = false;

  @observable
  String? privateKeyError;

  @observable
  bool isInFirstView = true;

  @observable
  bool isInSecondView = false;

  @observable
  bool isInThirdView = false;

  @observable
  int currentIndex = 0;

  @observable
  bool isObscuredPin = true;

  int animationDuration = 10;

  @action
  tapContinueButton(
    BuildContext context, {
    String? privateKey,
    String? username,
    String? pincode,
  }) async {
    if (isInFirstView) {
      if ((username ?? '').isEmpty) {
        openDialog(context);
      } else {
        //TODO: Validate private key with API
        updateIndex(1);
      }
    } else if (isInSecondView) {
      if ((privateKey ?? '').isEmpty) {
        openDialog(context);
      } else {
        // final result = await _userRecoverLoginUseCase(
        //   privateKey: privateKey ?? '',
        //   username: username ?? '',
        // );
        // result.fold(
        //   (left) {
        //     if (left == DomainError.requiredField) {
        //       privateKeyError = currentIndex == 0
        //           ? FlutterI18n.translate(
        //               context, 'recoverAccount.pleaseEnterYourRegisteredName')
        //           : currentIndex == 1
        //               ? FlutterI18n.translate(
        //                   context, 'recoverAccount.pleaseEnterYourPrivateKey')
        //               : FlutterI18n.translate(
        //                   context, 'recoverAccount.pleaseEnterYourPrivateKey');
        //     }
        //   },
        //   (right) => openDialog(context),
        // );
        updateIndex(2);
      }
    } else {
      if ((pincode ?? '').isEmpty) {
        openDialog(context);
      } else {
        //TODO: Validate private key with API
        updateIndex(1);
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
                      context, 'recoverAccount.pleaseEnterYourPinCode'),
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
        isAnimatingExitFirstView = false;
        isAnimatingExitSecondView = true;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = true;
          isInSecondView = false;
          currentIndex = 0;
          animationDuration = 5;
          isContinueButtonActive = true;
          isAnimatingExistFirstViewEnd = false;
          isAnimatingExitSecondViewEnd = true;
          timer.cancel();
        });
      }
    } else if (index == 1) {
      if (isInSecondView) {
        return;
      } else {
        isAnimatingExitSecondView = false;
        isAnimatingExitFirstView = true;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = false;
          isInThirdView = false;
          isInSecondView = true;
          currentIndex = 1;
          isContinueButtonActive = false;
          isAnimatingExitSecondViewEnd = false;
          isAnimatingExistFirstViewEnd = true;
          timer.cancel();
        });
      }
    } else if (index == 2) {
      if (isInThirdView) {
        return;
      } else {
        isAnimatingExitThirdView = false;
        isAnimatingExitSecondView = true;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = false;
          isInSecondView = false;
          isInThirdView = true;
          currentIndex = 2;
          isContinueButtonActive = false;
          isAnimatingExitThirdViewEnd = false;
          isAnimatingExitSecondViewEnd = true;
          timer.cancel();
        });
      }
    }
  }

  void openKeyboard(context, {required FocusNode inputNode, int? duration}) {
    Timer.periodic(Duration(seconds: duration ?? animationDuration), (timer) {
      FocusManager.instance.primaryFocus?.unfocus();
      FocusScope.of(context).requestFocus(inputNode);
      timer.cancel();
    });
  }

  Future<bool> onWillPop() async {
    if (isInFirstView) {
      //TODO: Go to initial page
      return false;
    } else if (isInSecondView) {
      updateIndex(0);
      isContinueButtonActive = true;
      return false;
    } else if (isInThirdView) {
      updateIndex(1);
      isContinueButtonActive = true;
      return false;
    } else {
      updateIndex(1);
      isContinueButtonActive = true;
      return false;
    }
  }

  void setObscuredPin() {
    isObscuredPin = !isObscuredPin;
  }
}
