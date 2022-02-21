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

  @action
  void updateLoadingLogoOpacity() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      showfirstViewFirstTextOpacity = true;
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      showfirstViewSecondTextOpacity = true;
    });
    Timer.periodic(const Duration(seconds: 2), (timer) {
      showfirstViewTextFieldOpacity = true;
    });
  }
}
