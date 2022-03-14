import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class SaveUserLocalAuthUsecase {
  Future<Either<DomainError, bool>> call(UserLocalAuthEntity user);
}
