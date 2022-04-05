import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  bool isBacking = false;

  @action
  setCurrentPage(int value) {
    if (currentPage > value) {
      isBacking = true;
      currentPage = value;
    } else {
      isBacking = false;
      currentPage = value;
    }
  }

  @action
  Future<void> backPage() async {
    if (currentPage == 0) {
      Routes.instance.goToLoginPageRoute();
      return;
    } else {
      currentPage = currentPage - 1;
    }
  }

  void openKeyboard(context, {required FocusNode inputNode, int? duration}) {
    if (currentPage == 2 || currentPage == 3) {
      return;
    } else {
      Future.delayed(Duration(seconds: duration ?? 10)).then((value) {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).requestFocus(inputNode);
      });
    }
  }
}
