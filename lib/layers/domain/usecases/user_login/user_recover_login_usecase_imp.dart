import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';

class UserRecoverLoginUseCaseImp implements UserRecoverLoginUseCase {
  final UserRecoverLoginRepository repository;

  UserRecoverLoginUseCaseImp({
    required this.repository,
  });

  @override
  Future<Either<DomainError, UserEntity>> call({
    required String username,
    required String privateKey,
  }) async {
    return await repository(username: username, privateKey: privateKey);
  }
}
