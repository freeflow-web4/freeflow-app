import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator.dart';
import 'package:freeflow/layers/domain/validators/username_validator/username_validator.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/controller/create_wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/choose/create_wallet_pin_code_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/confirm/create_wallet_confirm_pin_code_controller.dart';
import 'package:freeflow/layers/presentation/pages/login/controller/login_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/confirm_pin_code_view/recover_confirm_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/pin_code_view/recover_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/privatekey_view/recover_private_key_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_splash/controller/recover_splash_controller.dart';
import 'package:freeflow/layers/presentation/pages/splash/controller/splash_controller.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:get_it/get_it.dart';

registerControllerDependencies(GetIt getIt) {
  getIt.registerLazySingleton<RecoverAccountController>(
    () => RecoverAccountController(),
  );

  getIt.registerLazySingleton<RecoverPinCodeViewController>(
    () => RecoverPinCodeViewController(
      userHasBiometricsUsecase: getIt.get<UserHasBiometricsUsecase>(),
      userSetBiometricsUsecase: getIt.get<UserSetBiometricsUsecase>(),
      biometricDriver: getIt.get<BiometricAuthDriver>(),
      validator: getIt.get<PinValidator>(),
    ),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(),
  );
  getIt.registerFactory<RecoverSplashController>(
    () => RecoverSplashController(),
  );

  getIt.registerLazySingleton<LoginController>(
    () => LoginController(),
  );

  getIt.registerLazySingleton<AuthController>(
    () => AuthController(getIt.get<PinValidator>()),
  );
  getIt.registerLazySingleton<RecoverUsernameController>(
    () => RecoverUsernameController(
      validator: getIt.get<UsernameValidator>(),
      getUsernameExistsUsecase: getIt.get<GetUsernameExistsUsecase>(),
    ),
  );
  getIt.registerLazySingleton<RecoverConfirmPinCodeViewController>(
    () => RecoverConfirmPinCodeViewController(
      getIt.get<UserSetPincodeUsecase>(),
    ),
  );
  getIt.registerLazySingleton<RecoverPrivateKeyController>(
    () => RecoverPrivateKeyController(
      validator: getIt.get<PrivateKeyValidator>(),
      userRecoverLoginUseCase: getIt.get<UserRecoverLoginUseCase>(),
    ),
  );

  getIt.registerFactory<CreateWalletEmailController>(
    () => CreateWalletEmailController(),
  );

  getIt.registerFactory<CreateWalletPinCodeController>(
    () => CreateWalletPinCodeController(
      biometricDriver: getIt.get<BiometricAuthDriver>(),
      pinValidator: getIt.get<PinValidator>(),
    ),
  );

  getIt.registerFactory<CreateWalletController>(
    () => CreateWalletController(
      userCreateWalletUseCase: GetIt.I.get<UserCreateWalletUseCase>(),
      userSetBiometricsUsecase: GetIt.I.get<UserSetBiometricsUsecase>(),
    ),
  );
}
