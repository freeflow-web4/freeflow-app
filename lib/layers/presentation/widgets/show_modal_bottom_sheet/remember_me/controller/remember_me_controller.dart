import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/helpers/auth/authenticate_user.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'remember_me_controller.g.dart';

RememberMeController findRememberMeController() => GetIt.I.get<RememberMeController>();

class RememberMeController = _RememberMeControllerBase with _$RememberMeController;

abstract class _RememberMeControllerBase with Store, TextThemes {
  final UserSetBiometricsUsecase userSetBiometricsUsecase;
  final UserHasBiometricsUsecase userHasBiometricsUsecase;

  _RememberMeControllerBase({
    required this.userSetBiometricsUsecase,
    required this.userHasBiometricsUsecase,
  });

  @observable
  bool? biometricIsEnable;

  @action
  Future<void> getIfBiometricIsEnable() async {
    final result = await userHasBiometricsUsecase();
    result.fold(
          (l) => biometricIsEnable = false,
          (r) => biometricIsEnable = r,
    );
  }

  @action
  Future<bool> setBiometricStatus(bool status) async {
    final result = await userSetBiometricsUsecase(status);
    late bool success;
    result.fold(
          (l) => success = false,
          (r) {
        success = true;
        biometricIsEnable = status;
      },
    );
    return success;
  }

  Future<bool> authenticateUserWithPassword(BuildContext context) async{
    final auth = await authenticateUser(context, canAuthenticateWithBiometric: false);
    return  auth == true;
  }

  Future<bool?> changeBiometricStatus(BuildContext context, bool biometricStatus) async {
    bool status = await authenticateUserWithPassword(context);
    if(status){
      return await setBiometricStatus(biometricStatus);
    }
    return null;
  }

}
