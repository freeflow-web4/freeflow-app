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
}
