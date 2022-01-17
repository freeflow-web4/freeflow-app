import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserLoginUseCase {
  Future<UserEntity> call(String privateKey);
}
