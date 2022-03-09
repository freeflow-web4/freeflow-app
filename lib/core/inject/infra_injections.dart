import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage_imp.dart';
import 'package:get_it/get_it.dart';

registerInfraDependencies(GetIt getIt) {
  getIt.registerFactory<CacheStorage>(
    () => CacheStorageImp(storage: const FlutterSecureStorage()),
  );
}
