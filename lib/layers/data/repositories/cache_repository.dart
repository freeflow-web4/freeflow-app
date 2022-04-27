import 'package:freeflow/layers/domain/repositories/cache_repository.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';

class CacheRepositoryImpl extends CacheRepository {
  final CacheStorage cacheStorage;

  CacheRepositoryImpl(this.cacheStorage);
  @override
  Future<void> clear() {
    return cacheStorage.clear();
  }
}
