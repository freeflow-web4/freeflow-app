import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserLocalAuthRepository {
  Future<Either<DomainError, bool>> saveLocalAuthUser(UserEntity userEntity);
  Future<Either<DomainError, UserEntity>> getLocalAuthUser();
}
