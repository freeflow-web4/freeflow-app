import 'package:freeflow/layers/domain/entities/user_entity.dart';

abstract class UserLocalAuthDatasource {
  Future<UserEntity> getUser();
  Future<bool> saveUser(UserEntity user);
  Future<bool> saveUserIsLogged(bool value);
  Future<bool> getUserIsLogged();
}
