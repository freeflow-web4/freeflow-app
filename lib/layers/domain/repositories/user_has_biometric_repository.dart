import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserHasBiometricsRepository {
  Future<Either<DomainError, bool>> hasBiometrics();
}
