import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  final UserRecoverLoginUseCase userRecoverLoginUseCase;
  final BiometricAuthDriver biometricDriver;
  final UserSetPincodeUsecase userSetPincodeUsecase;
  final GetUsernameExistsUsecase getUsernameExistsUsecase;
  final SaveUserLocalAuthUsecase saveUserLocalAuthUsecase;

  RecoverAccountControllerBase({
    required this.userRecoverLoginUseCase,
    required this.biometricDriver,
    required this.userSetPincodeUsecase,
    required this.getUsernameExistsUsecase,
    required this.saveUserLocalAuthUsecase,
  });

  @observable
  int currentPage = 0;

  @action
  setCurrentPage(int value) => currentPage = value;

  @action
  Future<void> backPage() async {
    if (currentPage == 0) {
      return;
    } else {
      currentPage -= currentPage;
    }
  }

  void openKeyboard(context, {required FocusNode inputNode, int? duration}) {
    Timer.periodic(Duration(seconds: duration ?? 10), (timer) {
      FocusManager.instance.primaryFocus?.unfocus();
      FocusScope.of(context).requestFocus(inputNode);
      timer.cancel();
    });
  }
}
