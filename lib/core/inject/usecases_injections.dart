import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/validators/field_validator_imp.dart';
import 'package:get_it/get_it.dart';

registerUsecasesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginUseCase>(
    () => UserRecoverLoginUseCaseImp(
      repository: GetIt.I.get<UserRecoverLoginRepository>(),
      fieldValidator: FieldValidatorImp(),
    ),
  );

  getIt.registerFactory<UserHasBiometricsUsecase>(
    () => UserHasBiometricsUsecaseImp(GetIt.I.get<UserBiometricsRepository>()),
  );

  getIt.registerFactory<UserSetBiometricsUsecase>(
    () => UserSetBiometricsUsecaseImp(GetIt.I.get<UserBiometricsRepository>()),
  );
}
