import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';

abstract class UserLoginRepository {
  Future<Either<Exception, UserLoginDto>> call(String privateKey);
}
