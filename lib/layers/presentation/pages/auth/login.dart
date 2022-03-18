import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:get_it/get_it.dart';

class Login {
  void loginWithBiometrics(
    BuildContext context,
    Function onLoginSuccessCallBack,
    void Function(Exception) onBiometricsErrorCallBack,
  ) {
    final biomectricsUsecase = GetIt.I.get<UserHasBiometricsUsecase>();
    biomectricsUsecase().then((value) {
      value.fold(
        (_) {
          //TODO: analyse some error message here
        },
        (isBiometricsSaved) async {
          if (isBiometricsSaved) {
            try {
              final biometricsCheck = GetIt.I.get<BiometricAuthDriver>();
              final result = await biometricsCheck.authenticateUser();
              result.fold((error) {}, (auth) {
                if (auth) onLoginSuccessCallBack();
              });
            } on Exception catch (e) {
              onBiometricsErrorCallBack(e);
            }
          }
        },
      );
    });
  }

  void loginWithPin(
    PinValidator pinValidator,
    String currentPin,
    Function onLoginSuccessCallBack,
    Function onLoginFailedCallBack,
    Function onPinInvalid,
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
