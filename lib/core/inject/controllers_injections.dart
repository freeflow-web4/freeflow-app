import 'package:freeflow/layers/presentation/helpers/validators/field_validator_imp.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:get_it/get_it.dart';

import '../../layers/presentation/pages/recover_account_loading/controller/recover_account_loading_controller.dart';

registerControllerDependencies(GetIt getIt) {
  getIt.registerFactory<RecoverAccountLoadingController>(
    () => RecoverAccountLoadingController(),
  );

  getIt.registerFactory<RecoverAccountController>(
    () => RecoverAccountController(fieldValidator: FieldValidatorImp()),
  );
}
