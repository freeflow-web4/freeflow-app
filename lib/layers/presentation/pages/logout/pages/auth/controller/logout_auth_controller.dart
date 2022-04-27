import 'package:flutter/cupertino.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/layers/presentation/pages/auth/login.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'logout_auth_controller.g.dart';

LogoutAuthController findLogoutAuthController() =>
    GetIt.I.get<LogoutAuthController>();

class LogoutAuthController = _LogoutAuthControllerBase
    with _$LogoutAuthController;

abstract class _LogoutAuthControllerBase with Store, Login {
  @observable
  GradientTextFieldState pinFieldState = GradientTextFieldState.empty;

  @computed
  bool get formValid => GradientTextFieldState.valid == pinFieldState;

  @observable
  String currentPin = "";

  @observable
  bool isPinObscure = true;

  void init(BuildContext context) {
    loginWithBiometrics(
      context,
      onLoginSuccessCallBack: onFomValid,
    );
  }

  @action
  void onPinChanged(String pin) {
    currentPin = pin;
    if (currentPin.trim().isEmpty) {
      pinFieldState = GradientTextFieldState.empty;
    } else {
      loginWithPin(
        currentPin,
        onPinValid,
        onPinInValid,
      );
    }
  }

  void onKeyboardTap(String digit) {
    String nextCurrentText = '';
    if (digit == 'del') {
      final end = currentPin.length - 1 < 0 ? 0 : currentPin.length - 1;
      nextCurrentText = currentPin.substring(0, end);
    } else if (digit == 'X') {
      nextCurrentText = '';
    } else {
      if (currentPin.length >= 4) {
        return;
      }
      nextCurrentText = currentPin + digit;
    }
    onPinChanged(nextCurrentText);
  }

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }

  @action
  void onNextButtonPressed() {
    if (formValid) {
      Routes.instance.pop(data: const RouteResponse(body: true));
    }
  }

  @action
  void onPinValid() {
    pinFieldState = GradientTextFieldState.valid;
  }

  @action
  void onPinInValid() {
    pinFieldState = GradientTextFieldState.invalid;
  }

  void onButtonTap(bool activated) {
    if (formValid) {
      onFomValid();
    }
  }

  void onFomValid() {
    Routes.instance.pop(data: const RouteResponse(body: true));
  }
}
