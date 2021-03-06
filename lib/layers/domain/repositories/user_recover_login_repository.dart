import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserRecoverLoginRepository {
  Future<Either<DomainError, UserEntity>> auth({
    required String username,
    required String privateKey,
  });
}
