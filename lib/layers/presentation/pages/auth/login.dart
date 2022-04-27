import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:get_it/get_it.dart';

class Login {
  void loginWithBiometrics(
    BuildContext context, {
    bool canAuthenticateWithBiometric = true,
    Function? onLoginSuccessCallBack,
    Function? onLoginFailedCallBack,
    void Function(Exception)? onBiometricsErrorCallBack,
  }) {
    final biomectricsUsecase = GetIt.I.get<UserHasBiometricsUsecase>();
    biomectricsUsecase().then((value) {
      value.fold(
        (_) {
          //TODO: analyse some error message here
        },
        (isBiometricsSaved) async {
          if (isBiometricsSaved && canAuthenticateWithBiometric) {
            try {
              final biometricsCheck = GetIt.I.get<BiometricAuthDriver>();
              final result = await biometricsCheck.authenticateUser();
              result.fold((error) {}, (auth) {
                if (auth) {
                  onLoginSuccessCallBack?.call();
                } else {
                  onLoginFailedCallBack?.call();
                }
              });
            } on Exception catch (e) {
              onBiometricsErrorCallBack?.call(e);
            }
          }
        },
      );
    });
  }

  void loginWithPin(
    String currentPin,
    Function onLoginSuccessCallBack,
    Function onLoginFailedCallBack,
  ) async {
    final isPinCorrect =
        await GetIt.I.get<UserCheckPinCodeUsecase>().call(currentPin);
    isPinCorrect.fold((_) {}, (success) {
      if (success) {
        onLoginSuccessCallBack();
      } else {
        onLoginFailedCallBack();
      }
    });
  }
}
