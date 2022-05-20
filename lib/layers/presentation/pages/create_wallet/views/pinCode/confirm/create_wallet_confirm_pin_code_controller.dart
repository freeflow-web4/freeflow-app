import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:mobx/mobx.dart';
part 'create_wallet_confirm_pin_code_controller.g.dart';

class CreateWalletConfirmPinCodeController = _CreateWalletConfirmPinCodeControllerBase
    with _$CreateWalletConfirmPinCodeController;

abstract class _CreateWalletConfirmPinCodeControllerBase with Store {
  @observable
  GradientTextFieldState pinFieldState = GradientTextFieldState.empty;

  @computed
  bool get formValid => GradientTextFieldState.valid == pinFieldState;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.valid == pinFieldState;

  @observable
  bool isPinObscure = true;

  @observable
  bool rememberMe = false;

  @observable
  String currentPinCode = "";

  String correctPinCode;

  _CreateWalletConfirmPinCodeControllerBase(this.correctPinCode);

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }

  @action
  void onPinChanged(String value) {
    if (value.trim().isEmpty) {
      pinFieldState = GradientTextFieldState.empty;
    } else if ((value.length < 4)) {
      pinFieldState = GradientTextFieldState.typing;
    } else if (isPinCodeValid(value)) {
      pinFieldState = GradientTextFieldState.valid;
    } else {
      pinFieldState = GradientTextFieldState.invalid;
    }
  }

  @action
  void _updateCurrentPinCode(String value) {
    currentPinCode = value;
  }

  @action
  void onNextButtonPressed(
    void Function() onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid();
    } else {
      onInvalid();
    }
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }

  void onKeyboardTap(String digit) {
    String nextCurrentText = '';
    if (digit == 'del') {
      final end = currentPinCode.length - 1 < 0 ? 0 : currentPinCode.length - 1;
      nextCurrentText = currentPinCode.substring(0, end);
    } else if (digit == 'X') {
      nextCurrentText = '';
    } else {
      if (currentPinCode.length >= 4) {
        return;
      }
      nextCurrentText = currentPinCode + digit;
    }
    onPinChanged(nextCurrentText);

    _updateCurrentPinCode(nextCurrentText);
  }

  bool isPinCodeValid(String pinCode) {
    return pinCode == correctPinCode;
  }
}
