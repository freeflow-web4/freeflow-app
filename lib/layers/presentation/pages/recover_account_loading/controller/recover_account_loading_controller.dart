import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:get_it/get_it.dart';
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

  @observable
  double loadingLogoOpacity = 0.0;

  @action
  void updateLoadingLogoOpacity() {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter < 5) {
        if (showLogoLoading1 != true) {
          loadingLogoOpacity = 1;
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
        loadingLogoOpacity = 0;
        loadingLogoVisible = false;
      }
    });
  }

  void goToRecoverAccountPage(BuildContext context) {
    if (!loadingLogoVisible) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GetIt.I.get<RecoverAccountPage>(),
          ),
        );
      });
    }
  }
}
