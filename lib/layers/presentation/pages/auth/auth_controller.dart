import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/show_snackbar_dialog.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

enum PinFieldState { empty, valid, invalid }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final PinValidator pinValidator;

  AuthControllerBase(this.pinValidator);

  @observable
  PinFieldState pinFieldState = PinFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == PinFieldState.valid;

  @observable
  bool isPinObscure = true;

  void biometricsLoginFlow(
    BuildContext context,
    Function onLoginSuccessCallBack,
  ) {
    final biomectricsUsecase = GetIt.I.get<UserHasBiometricsUsecase>();
    biomectricsUsecase().then((value) {
      value.fold(
        (error) => onBiometricsError(context, Exception(error.toString())),
        (isBiometricsSaved) {
          if (isBiometricsSaved) {
            try {
              loginWithBiometrics(
                context,
                onLoginSuccessCallBack,
              );
            } on Exception catch (e) {
              onBiometricsError(context, e);
            }
          }
        },
      );
    });
  }

  void loginWithArrowButton(String pin, Function onLoginSuccessCallBack) {
    login(pin, onLoginSuccessCallBack);
  }

  void login(String pin, Function onLoginSuccessCallBack) {
    if (pinValidator(pin)) {
      pinFieldState = PinFieldState.valid;
      onLoginSuccessCallBack.call().then((_) {
        nextPage();
      });
    } else {
      pinFieldState = PinFieldState.invalid;
    }
  }

  void onLoginSuccess() {
    nextPage();
  }

  void loginWithBiometrics(
    BuildContext context,
    Function onLoginSuccessCallBack,
  ) async {
    //TODO: call biometrics from system
  }

  void nextPage() {
    print("hello");
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
    return nextCurrentText;
  }

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }
}
