import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserLoginUseCase {
  Future<Either<Exception, UserEntity>> call(String privateKey);
}
