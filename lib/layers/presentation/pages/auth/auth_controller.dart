import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/show_snackbar_dialog.dart';
import 'package:freeflow/layers/domain/validators/pin_validator.dart';
import 'package:freeflow/layers/presentation/pages/auth/login.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

enum PinFieldState { empty, valid, invalid, wrong }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store, Login {
  final PinValidator pinValidator;

  AuthControllerBase(this.pinValidator);

  @observable
  PinFieldState pinFieldState = PinFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == PinFieldState.valid;

  @observable
  bool isPinObscure = true;

  void onLoginSuccess(Function onLoginSuccessCallBack) {
    onLoginSuccessCallBack.call().then((_) {
      nextPage();
    });
  }

  void onLoginWithPin(String currentPin, Function loginAnimationCallBack) {
    loginWithPin(
      pinValidator,
      currentPin,
      () => onLoginSuccess(loginAnimationCallBack),
      () => updatePinFieldState(PinFieldState.wrong),
      () => updatePinFieldState(PinFieldState.invalid),
    );
  }

  void nextPage() {
    print("hellohellohellohellohellohellohellohellohellohellohello");
  }

  @action
  void onPinChanged(String value) {
    final isPinValid = pinValidator(value);
    if (isPinValid) {
      pinFieldState = PinFieldState.valid;
    } else {
      pinFieldState = PinFieldState.invalid;
    }
  }

  void onBiometricsError(BuildContext context, Exception error) {
    final errorMessage =
        TranslationService.translate(context, 'auth.biometricsError');
    showSnackBar(context, errorMessage);
  }

  @action
  String onKeyboardTap(String digit, String currentPinFieldText) {
    String nextCurrentText = '';
    if (digit == 'X') {
      final end = currentPinFieldText.length - 1 < 0
          ? 0
          : currentPinFieldText.length - 1;
      nextCurrentText = currentPinFieldText.substring(0, end);
    } else if (digit == 'del') {
      nextCurrentText = '';
    } else {
      nextCurrentText = currentPinFieldText + digit;
    }
    onPinChanged(nextCurrentText);

    return nextCurrentText;
  }

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }

  @action
  void updatePinFieldState(PinFieldState state) {
    pinFieldState = state;
  }
}
