import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class SaveUserIsLoggedUsecase {
  Future<Either<DomainError, bool>> call(bool value);
}
