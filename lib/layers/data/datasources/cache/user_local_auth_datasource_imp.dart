import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_local_auth/user_local_auth_dto.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class UserLocalAuthDatasourceImp implements UserLocalAuthDatasource {
  final CacheStorage cacheStorage;
  UserLocalAuthDatasourceImp(this.cacheStorage);

  @override
  Future<UserLocalAuthEntity> getUser() async {
    final response = await cacheStorage.get('userLocalAuth');
    final userLocalAuth =
        UserLocalAuthDto.fromJson(jsonDecode(response)).toEntity();
    return userLocalAuth;
  }

  @override
  Future<bool> saveUser(UserLocalAuthEntity user) async {
    final jsonEntity = UserLocalAuthDto.fromEntity(user).toJson();
    await cacheStorage.save(
      key: 'userLocalAuth',
      value: jsonEncode(jsonEntity),
    );
    return true;
  }
}
