import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase.dart';

class UserLoginUseCaseImp implements UserLoginUseCase {
  final UserLoginRepository _repository;

  UserLoginUseCaseImp(this._repository);

  @override
  Future<Either<Exception, UserEntity>> call(String privateKey) {
    return _repository(privateKey);
  }
}
