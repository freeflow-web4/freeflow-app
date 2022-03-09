import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/pages/login/controller/login_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/splash/controller/splash_controller.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/pages/recover_account_loading/controller/recover_account_loading_controller.dart';

registerControllerDependencies(GetIt getIt) {
  //TODO: analyse if it could be lazy
  getIt.registerFactory<RecoverAccountLoadingController>(
    () => RecoverAccountLoadingController(),
  );

  //TODO: analyse if it could be lazy
  getIt.registerFactory<RecoverAccountController>(
    () => RecoverAccountController(GetIt.I.get<UserRecoverLoginUseCase>()),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(),
  );

  getIt.registerLazySingleton<LoginController>(
    () => LoginController(),
  );

  getIt.registerSingleton<InAppKeyboardController>(InAppKeyboardController());

  getIt.registerLazySingleton<AuthController>(() => AuthController(GetIt.I.get()));
}
