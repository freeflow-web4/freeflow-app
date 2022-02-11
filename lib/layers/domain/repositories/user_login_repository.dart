import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserLoginRepository {
  Future<Either<DomainError, UserLoginDto>> call(
      {required String username, required String privateKey});
}
