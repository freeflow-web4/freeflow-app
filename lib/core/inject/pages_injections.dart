import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/pages/recover_account_loading/controller/recover_account_loading_controller.dart';
import '../../layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart';

registerPageDependencies(GetIt getIt) {
  getIt.registerFactory<RecoverAccountLoadingPage>(
    () => RecoverAccountLoadingPage(
      recoverAccountLoadingController:
          getIt.get<RecoverAccountLoadingController>(),
    ),
  );

  getIt.registerFactory<RecoverAccountPage>(
    () => RecoverAccountPage(
      recoverAccountController: getIt.get<RecoverAccountController>(),
    ),
  );
}
