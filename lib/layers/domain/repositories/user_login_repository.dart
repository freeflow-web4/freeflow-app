import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserLoginRepository {
  Future<UserEntity> call(String privateKey);
}
