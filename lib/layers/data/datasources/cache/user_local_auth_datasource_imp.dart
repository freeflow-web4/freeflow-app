import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class UserLocalAuthDatasourceImp implements UserLocalAuthDatasource {
  final CacheStorage cacheStorage;
  UserLocalAuthDatasourceImp(this.cacheStorage);

  @override
  Future<UserEntity> getUser() async {
    final response = await cacheStorage.get('userLocalAuth');
    final userLocalAuth =
        UserRecoverLoginDto.fromJson(jsonDecode(response)).toEntity();
    return userLocalAuth;
  }

  @override
  Future<bool> saveUser(UserEntity user) async {
    final jsonEntity = UserRecoverLoginDto.fromEntity(user).toJson();
    await cacheStorage.save(
      key: 'userLocalAuth',
      value: jsonEncode(jsonEntity),
    );
    return true;
  }
}
