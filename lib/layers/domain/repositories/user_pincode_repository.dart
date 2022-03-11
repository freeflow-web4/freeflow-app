import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserPincodeRepository {
  Future<Either<DomainError, bool>> getPinCode();
  Future<Either<DomainError, bool>> setPincode(String pincode);
}
