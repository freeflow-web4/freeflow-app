import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:mobx/mobx.dart';

part 'recover_pin_code_view_controller.g.dart';

enum PinCodeFieldState {
  initial,
  empty,
  valid,
  invalid,
  wrong,
  connectionError
}

class RecoverPinCodeViewController = RecoverPinCodeViewControllerBase
    with _$RecoverPinCodeViewController;

abstract class RecoverPinCodeViewControllerBase with Store {
  final UserHasBiometricsUsecase userHasBiometricsUsecase;
  final UserSetBiometricsUsecase userSetBiometricsUsecase;
  final BiometricAuthDriver biometricDriver;
  final PinValidator validator;
  RecoverPinCodeViewControllerBase({
    required this.userHasBiometricsUsecase,
    required this.userSetBiometricsUsecase,
    required this.biometricDriver,
    required this.validator,
  });

  @observable
  bool isPinValid = false;

  @observable
  bool isObscuredPin = true;

  @observable
  bool rememberMe = false;

  @observable
  String currentPinCode = '';

  @observable
  bool hasAvailableBiometrics = false;

  @observable
  String confirmPinCode = '';

  @observable
  bool isBiometricAvailable = true;

  @observable
  PinCodeFieldState pinCodeFieldState = PinCodeFieldState.initial;

  @computed
  bool get isPinCodeValid => pinCodeFieldState == PinCodeFieldState.valid;

  @action
  Future<void> setRememberMe(bool value) async {
    await userSetBiometricsUsecase(value);
    rememberMe = value;
  }

  @action
  Future<void> onPinCodeChanged(
    String value,
  ) async {
    validatePinCode(value);
  }

  @action
  Future<void> validatePinCode(
    String value,
  ) async {
    if (value.length < 4) {
      onValidatePinCodeEmpty();
    } else {
      final _isPinValid = validator(value);
      if (_isPinValid) {
        onValidatePinCodeSuccess(value);
      } else {
        onValidatePinCodeFailure();
      }
    }
  }

  @action
  void onValidatePinCodeSuccess(String value) {
    updatePinCodeFieldState(PinCodeFieldState.valid);
    currentPinCode = value;
  }

  @action
  void onValidatePinCodeFailure() {
    updatePinCodeFieldState(PinCodeFieldState.invalid);
  }

  @action
  void onValidatePinCodeEmpty() {
    updatePinCodeFieldState(PinCodeFieldState.empty);
  }

  @action
  void updatePinCodeFieldState(PinCodeFieldState state) {
    pinCodeFieldState = state;
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
  ) {
    if (value == 'del') {
      if (currentPinCode == '') {
        return;
      } else {
        currentPinCode = currentPinCode.substring(0, currentPinCode.length - 1);
      }
    } else if (value == 'X') {
      currentPinCode = '';
    } else {
      if (currentPinCode.length == 4) {
        return;
      } else {
        currentPinCode = currentPinCode + value;
      }
    }
    onPinCodeChanged(currentPinCode);
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

  @action
  Future<void> hasBiometricAvailable() async {
    final result = await biometricDriver.getAvailableBiometrics();
    result.fold(
      (l) => isBiometricAvailable = false,
      (r) => isBiometricAvailable = r.isNotEmpty,
    );
  }
}
