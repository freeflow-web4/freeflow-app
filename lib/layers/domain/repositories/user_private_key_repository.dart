import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserPrivateKeyRepository {
  Future<Either<DomainError, String>> getPrivateKey();
  Future<Either<DomainError, bool>> setPrivateKey(String value);
}
