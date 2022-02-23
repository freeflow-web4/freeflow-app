import 'package:freeflow/layers/presentation/pages/login/controller/login_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/splash/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/pages/recover_account_loading/controller/recover_account_loading_controller.dart';

registerControllerDependencies(GetIt getIt) {
  //TODO: analyse if it could be lazy
  getIt.registerFactory<RecoverAccountLoadingController>(
    () => RecoverAccountLoadingController(),
  );

  //TODO: analyse if it could be lazy
  getIt.registerFactory<RecoverAccountController>(
    () => RecoverAccountController(),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(),
  );

  getIt.registerLazySingleton<LoginController>(
    () => LoginController(),
  );
}
