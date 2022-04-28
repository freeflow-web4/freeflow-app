import 'dart:convert';
import 'package:freeflow/layers/data/datasources/user_private_key_datasource.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class UserPrivateKeyDatasourceImp implements UserPrivateKeyDatasource {
  final CacheStorage cacheStorage;
  UserPrivateKeyDatasourceImp(this.cacheStorage);

  @override
  Future<String> getPrivateKey() async {
    try {
      final response = (await cacheStorage.get('privateKey') as String?) ?? '';
      if (response.isEmpty) {
        return response;
      }
      return jsonDecode(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> setPrivateKey(String value) async {
    try {
      await cacheStorage.save(
        key: 'privateKey',
        value: jsonEncode(value),
      );
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
