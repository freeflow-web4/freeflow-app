import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class CacheStorageImp implements CacheStorage {
  final FlutterSecureStorage storage;
  CacheStorageImp({required this.storage});

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future get(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> save({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }
}
