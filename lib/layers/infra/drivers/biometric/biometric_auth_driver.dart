import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class BiometricAuthDriver {
  Future<Either<DomainError, bool>> isBiometricAvailable();
  Future<Either<DomainError, List<dynamic>>> getAvailableBiometrics();
  Future<Either<DomainError, bool>> authenticateUser();
}
