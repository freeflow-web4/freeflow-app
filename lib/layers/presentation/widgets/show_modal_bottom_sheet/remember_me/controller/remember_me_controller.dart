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

  @observable
  bool? hasBiometric;

  @action
  Future<void> getIfHasBiometric() async {
    final result = await userHasBiometricsUsecase();
    result.fold(
          (l) => hasBiometric = false,
          (r) => hasBiometric = r,
    );
  }

  @action
  Future<bool> setBiometric(bool status) async {
    final result = await userSetBiometricsUsecase(status);
    late bool success;
    result.fold(
          (l) => success = false,
          (r) {
        success = true;
        hasBiometric = status;
      },
    );
    return success;
  }


  Future<bool> canChangeSetBiometrics(context) async{
    final auth = await authenticateUser(context, canVerifyWithBiometric: false);
    return  auth == true;

  }


  _RememberMeControllerBase({
    required this.userSetBiometricsUsecase,
    required this.userHasBiometricsUsecase,
  });






}
