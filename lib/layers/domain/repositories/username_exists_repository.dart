import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UsernameExistsRepository {
  Future<Either<DomainError, bool>> getUsernameExists(String username);
}
