import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class UserPincodeDatasourceImp implements UserPincodeDatasource {
  final CacheStorage cacheStorage;
  UserPincodeDatasourceImp(this.cacheStorage);

  @override
  Future<String> getPincode() async {
    try {
      final response = await cacheStorage.get('userPincode');
      return jsonDecode(response);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> setPincode(String pincode) async {
    try {
      await cacheStorage.save(
        key: 'userPincode',
        value: jsonEncode(pincode),
      );
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
