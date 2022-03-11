import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserSetPincodeUsecase {
  Future<Either<DomainError, bool>> call(String value);
}
