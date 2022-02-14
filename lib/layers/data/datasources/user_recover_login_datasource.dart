import 'package:freeflow/layers/data/dtos/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserLoginDataSource {
  Future<UserEntity> call({
    required String username,
    required String privateKey,
  });
}
