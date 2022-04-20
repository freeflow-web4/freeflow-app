import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage_imp.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/layers/infra/http/dio_http_client_imp.dart';
import 'package:freeflow/layers/infra/http/dio_instance.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

import '../../layers/infra/drivers/biometric/biometric_auth_driver_imp.dart';

registerInfraDependencies(GetIt getIt) {
  getIt.registerFactory<HttpClient>(() => DioHttpClientImp(DioInstance.api()));

  getIt.registerFactory<CacheStorage>(
    () => CacheStorageImp(storage: const FlutterSecureStorage()),
  );

  getIt.registerFactory<BiometricAuthDriver>(
    () => BiometricAuthDriverImp(LocalAuthentication()),
  );
  getIt.registerLazySingleton<AuthInterceptors>(
    () => AuthInterceptors(
      userIsLoggedUsecase: getIt.get<GetUserIsLoggedUsecase>(),
      userLocalAuthUsecase: getIt.get<GetUserLocalAuthUsecase>(),
    ),
  );
}
