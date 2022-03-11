import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';

abstract class UserLocalAuthDatasource {
  Future<UserLocalAuthEntity> getUser();
  Future<bool> saveUser(UserLocalAuthEntity user);
}
