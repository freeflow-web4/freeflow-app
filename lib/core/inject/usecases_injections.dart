import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase_Imp.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase_imp.dart';
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

  getIt.registerFactory<UserSetPincodeUsecase>(
    () => UserSetPincodeUsecaseImp(GetIt.I.get<UserPincodeRepository>()),
  );

  getIt.registerFactory<UserCheckPinCodeUsecase>(
    () => UserCheckPinCodeUsecaseImp(GetIt.I.get<UserPincodeRepository>()),
  );
  
  getIt.registerFactory<GetUsernameExistsUsecase>(
    () => GetUsernameExistsUsecaseImp(GetIt.I.get<UsernameExistsRepository>()),
  );
  getIt.registerFactory<SaveUserLocalAuthUsecase>(
    () => SaveUserLocalAuthUsecaseImp(GetIt.I.get<UserLocalAuthRepository>()),
  );
}
