import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:mobx/mobx.dart';

part 'recover_confirm_pin_code_view_controller.g.dart';

enum ConfirmPinCodeFieldState {
  initial,
  empty,
  valid,
  invalid,
}

class RecoverConfirmPinCodeViewController = RecoverConfirmPinCodeViewControllerBase
    with _$RecoverConfirmPinCodeViewController;

abstract class RecoverConfirmPinCodeViewControllerBase with Store {
  final UserSetPincodeUsecase userSetPincodeUsecase;
  final SaveUserIsLoggedUsecase saveUserIsLoggedUsecase;

  RecoverConfirmPinCodeViewControllerBase({
    required this.userSetPincodeUsecase,
    required this.saveUserIsLoggedUsecase,
  });

  @observable
  bool isObscuredPin = true;

  @observable
  bool rememberMe = false;

  @observable
  String currentConfirmPinCode = '';

  @observable
  bool hasAvailableBiometrics = false;

  @observable
  bool isBiometricAvailable = true;

  @observable
  ConfirmPinCodeFieldState confirmPinCodeFieldState =
      ConfirmPinCodeFieldState.initial;

  @computed
  bool get isConfirmPinCodeValid =>
      confirmPinCodeFieldState == ConfirmPinCodeFieldState.valid;

  @action
  Future<void> onPinCodeChanged(
    String value,
    String pinCode,
  ) async {
    validatePinCode(value, pinCode);
  }

  @action
  Future<void> validatePinCode(
    String value,
    String pinCode,
  ) async {
    if (value.length < 4) {
      updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState.empty);
    } else {
      if (value == pinCode) {
        onValidatePinCodeSuccess(value);
      } else {
        updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState.invalid);
      }
    }
  }

  void savePinCode() => userSetPincodeUsecase(currentConfirmPinCode);

  void saveUserIsLogged() => saveUserIsLoggedUsecase(true);

  @action
  void onValidatePinCodeSuccess(String value) {
    updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState.valid);
    currentConfirmPinCode = value;
    savePinCode();
    saveUserIsLogged();
  }

  @action
  void onValidatePinCodeFailure() {
    updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState.invalid);
  }

  @action
  void onValidatePinCodeEmpty() {
    updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState.empty);
  }

  @action
  void updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState state) {
    confirmPinCodeFieldState = state;
  }

  @action
  void setObscuredPin() {
    isObscuredPin = !isObscuredPin;
  }

  @action
  void getTypePinCode(
    BuildContext context,
    String value,
    String pinCode,
  ) {
    if (value == 'del') {
      if (currentConfirmPinCode == '') {
        return;
      } else {
        currentConfirmPinCode = currentConfirmPinCode.substring(
            0, currentConfirmPinCode.length - 1);
      }
    } else if (value == 'X') {
      currentConfirmPinCode = '';
    } else {
      if (currentConfirmPinCode.length == 4) {
        return;
      } else {
        currentConfirmPinCode = currentConfirmPinCode + value;
      }
    }
    onPinCodeChanged(currentConfirmPinCode, pinCode);
  }
}
