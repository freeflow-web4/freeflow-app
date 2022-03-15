import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:mobx/mobx.dart';

part 'recover_pin_code_view_controller.g.dart';

class RecoverPinCodeViewController = RecoverPinCodeViewControllerBase
    with _$RecoverPinCodeViewController;

abstract class RecoverPinCodeViewControllerBase with Store {
  final UserHasBiometricsUsecase userHasBiometricsUsecase;
  final UserSetBiometricsUsecase userSetBiometricsUsecase;
  final BiometricAuthDriver biometricDriver;
  RecoverPinCodeViewControllerBase({
    required this.userHasBiometricsUsecase,
    required this.userSetBiometricsUsecase,
    required this.biometricDriver,
  });

  @observable
  bool isPinValid = false;

  @observable
  bool isObscuredPin = true;

  @observable
  bool rememberMe = false;

  @observable
  String pinCode = '';

  @observable
  bool hasAvailableBiometrics = false;

  @observable
  String confirmPinCode = '';

  @action
  Future<void> setRememberMe(bool value) async {
    await userSetBiometricsUsecase(value);
    rememberMe = value;
  }

  @action
  Future<void> biometricAuth(bool value) async {
    if (value) {
      final biometricResult = await biometricDriver.authenticateUser();
      biometricResult.fold(
        (l) => setRememberMe(false),
        (r) => setRememberMe(true),
      );
    } else {
      setRememberMe(false);
    }
  }

  @action
  void setObscuredPin() {
    isObscuredPin = !isObscuredPin;
  }

  @action
  void getTypePinCode(
    BuildContext context,
    String value,
    void Function(BuildContext context, String pinCode) onChangedField,
  ) {
    if (value == 'del') {
      if (pinCode == '') {
        return;
      } else {
        pinCode = pinCode.substring(0, pinCode.length - 1);
      }
    } else if (value == 'X') {
      pinCode = '';
    } else {
      if (pinCode.length == 4) {
        return;
      } else {
        pinCode = pinCode + value;
      }
    }
    onChangedField(context, pinCode);
  }

  @action
  void getTypeConfirmPinCode(
    BuildContext context,
    String value,
    void Function(BuildContext context, String pinCode) onChangedField,
  ) {
    if (value == 'del') {
      if (confirmPinCode == '') {
        return;
      } else {
        confirmPinCode = confirmPinCode.substring(0, confirmPinCode.length - 1);
      }
    } else if (value == 'X') {
      confirmPinCode = '';
    } else {
      if (confirmPinCode.length == 4) {
        return;
      } else {
        confirmPinCode = confirmPinCode + value;
      }
    }
    onChangedField(context, confirmPinCode);
  }

  Future<List<dynamic>> getAvailableBiometrics() async {
    List<dynamic> availableBiometrics = [];
    final biometricTypesResponse =
        await biometricDriver.getAvailableBiometrics();
    biometricTypesResponse.fold(
      (l) => null,
      (r) => availableBiometrics = r,
    );
    return availableBiometrics;
  }

  @action
  Future<void> canCheckBiometrics() async {
    final isBiometricAvailableResponse =
        await biometricDriver.isBiometricAvailable();
    isBiometricAvailableResponse.fold(
      (l) => hasAvailableBiometrics = false,
      (r) => hasAvailableBiometrics = r,
    );
  }
}
