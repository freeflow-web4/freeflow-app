import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase_imp.dart';
import 'package:freeflow/layers/domain/validators/field_validator_imp.dart';
import 'package:get_it/get_it.dart';

registerUsecasesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginUseCase>(
    () => UserRecoverLoginUseCaseImp(
      repository: GetIt.I.get<UserRecoverLoginRepository>(),
      fieldValidator: FieldValidatorImp(),
    ),
  );
}
