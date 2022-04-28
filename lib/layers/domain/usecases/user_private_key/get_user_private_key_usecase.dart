import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class GetUserPrivateKeyUsecase {
  Future<Either<DomainError, String>> call();
}
