import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase.dart';

class UserLoginUseCaseImp implements UserLoginUseCase {
  final UserLoginRepository _repository;

  UserLoginUseCaseImp(this._repository);

  @override
  Future<Either<DomainError, UserEntity>> call({
    required String username,
    required String privateKey,
  }) async {
    return await _repository(username: username, privateKey: privateKey);
  }
}
