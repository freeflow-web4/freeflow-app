import 'dart:async';

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

  @action
  void updateWidgetAnimations() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      showfirstViewFirstTextOpacity = true;
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      showfirstViewSecondTextOpacity = true;
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      showfirstViewTextFieldOpacity = true;
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {
      showContinueButton = true;
    });
    Timer.periodic(const Duration(seconds: 6), (timer) {
      isContinueButtonAnimating = false;
    });
  }
}
