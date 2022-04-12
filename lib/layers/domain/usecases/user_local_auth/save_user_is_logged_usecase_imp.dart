import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';

import 'save_user_is_logged_usecase.dart';

class SaveUserIsLoggedUsecaseImp implements SaveUserIsLoggedUsecase {
  final UserLocalAuthRepository repository;
  SaveUserIsLoggedUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, bool>> call(bool value) async {
    return await repository.saveUserIsLogged(value);
  }
}
