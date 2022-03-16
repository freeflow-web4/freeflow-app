import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_pin_code_view_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';

registerControllerDependencies(GetIt getIt) {
  getIt.registerLazySingleton<RecoverAccountController>(
    () => RecoverAccountController(
      userRecoverLoginUseCase: getIt.get<UserRecoverLoginUseCase>(),
      biometricDriver: getIt.get<BiometricAuthDriver>(),
      userSetPincodeUsecase: getIt.get<UserSetPincodeUsecase>(),
      getUsernameExistsUsecase: getIt.get<GetUsernameExistsUsecase>(),
      saveUserLocalAuthUsecase: getIt.get<SaveUserLocalAuthUsecase>(),
    ),
  );

  getIt.registerLazySingleton<RecoverPinCodeViewController>(
    () => RecoverPinCodeViewController(
      userHasBiometricsUsecase: getIt.get<UserHasBiometricsUsecase>(),
      userSetBiometricsUsecase: getIt.get<UserSetBiometricsUsecase>(),
      biometricDriver: getIt.get<BiometricAuthDriver>(),
    ),
  );
}
