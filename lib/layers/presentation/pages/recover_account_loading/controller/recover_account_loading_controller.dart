import 'package:flutter/material.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';
part 'recover_account_loading_controller.g.dart';

class RecoverAccountLoadingController = RecoverAccountLoadingControllerBase
    with _$RecoverAccountLoadingController;

abstract class RecoverAccountLoadingControllerBase with Store {
  @observable
  bool showLogoLoading1 = false;

  @observable
  bool showLogoLoading2 = false;

  @observable
  bool showLogoLoading3 = false;

  @observable
  bool loadingLogoVisible = true;

  @action
  void updateLoadingLogoOpacity() {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter < 5) {
        if (showLogoLoading1 != true) {
          showLogoLoading1 = true;
          counter++;
        } else if (showLogoLoading1 == true) {
          showLogoLoading1 = false;
          showLogoLoading2 = true;
          counter++;
        } else if (showLogoLoading2 == true) {
          showLogoLoading2 = false;
          showLogoLoading3 = true;
          counter++;
        }
      } else {
        loadingLogoVisible = false;
      }
    });
  }

  void goToRecoverAccountPage(BuildContext context) {
    Routes.instance.goToRecoverAccountPageRoute(context);
  }
}
