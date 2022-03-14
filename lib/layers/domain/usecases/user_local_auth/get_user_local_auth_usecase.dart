import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class GetUserLocalAuthUsecase {
  Future<Either<DomainError, UserLocalAuthEntity>> call();
}
