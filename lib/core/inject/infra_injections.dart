import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage_imp.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

import '../../layers/infra/drivers/biometric/biometric_auth_driver_imp.dart';

registerInfraDependencies(GetIt getIt) {
  getIt.registerFactory<CacheStorage>(
    () => CacheStorageImp(storage: const FlutterSecureStorage()),
  );

  getIt.registerFactory<BiometricAuthDriver>(
    () => BiometricAuthDriverImp(LocalAuthentication()),
  );
}
