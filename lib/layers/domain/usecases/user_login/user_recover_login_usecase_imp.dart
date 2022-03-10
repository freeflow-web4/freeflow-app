import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/validators/field_validator.dart';

class UserRecoverLoginUseCaseImp implements UserRecoverLoginUseCase {
  final UserRecoverLoginRepository repository;
  final FieldValidator fieldValidator;

  UserRecoverLoginUseCaseImp({
    required this.repository,
    required this.fieldValidator,
  });

  @override
  Future<Either<DomainError, UserEntity>> call({
    required String username,
    required String privateKey,
  }) async {
    final usernameValidation = fieldValidator.validateRequiredField(username);
    final privateKeyValidation =
        fieldValidator.validateRequiredField(privateKey);
    if (usernameValidation != null || privateKeyValidation != null) {
      return const Left(DomainError.requiredField);
    }
    return await repository.auth(username: username, privateKey: privateKey);
  }
}
