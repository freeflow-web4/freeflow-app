import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserRecoverLoginRepository {
  Future<Either<DomainError, UserRecoverLoginDto>> call(
      {required String username, required String privateKey});
}
