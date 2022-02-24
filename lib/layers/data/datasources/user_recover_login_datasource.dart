import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserRecoverLoginDataSource {
  Future<UserEntity> call({
    required String username,
    required String privateKey,
  });
}
