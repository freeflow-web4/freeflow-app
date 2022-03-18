import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserRecoverLoginDataSource {
  Future<UserEntity> recover({
    required String username,
    required String privateKey,
  });
}
