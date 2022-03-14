import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_pin_code_view_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/pages/recover_account_loading/controller/recover_account_loading_controller.dart';

registerControllerDependencies(GetIt getIt) {
  getIt.registerFactory<RecoverAccountLoadingController>(
    () => RecoverAccountLoadingController(),
  );

  getIt.registerLazySingleton<RecoverAccountController>(
    () => RecoverAccountController(
      userRecoverLoginUseCase: getIt.get<UserRecoverLoginUseCase>(),
      biometricDriver: getIt.get<BiometricAuthDriver>(),
      userSetPincodeUsecase: getIt.get<UserSetPincodeUsecase>(),
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
