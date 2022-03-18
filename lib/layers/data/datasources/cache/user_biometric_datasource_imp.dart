import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class UserBiometricsDatasourceImp implements UserBiometricsDataSource {
  final CacheStorage cacheStorage;
  UserBiometricsDatasourceImp(this.cacheStorage);

  @override
  Future<bool> getHasBiometrics() async {
    final response = await cacheStorage.get('userHasBiometrics') ?? 'false';
    return jsonDecode(response);
  }

  @override
  Future<bool> setHasBiometrics(bool hasBiometrics) async {
    await cacheStorage.save(
      key: 'userHasBiometrics',
      value: jsonEncode(hasBiometrics),
    );
    return hasBiometrics;
  }
}
