import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserBiometricsRepository {
  Future<Either<DomainError, bool>> getHasBiometrics();
  Future<Either<DomainError, bool>> setHasBiometrics(bool hasBiometrics);
}
