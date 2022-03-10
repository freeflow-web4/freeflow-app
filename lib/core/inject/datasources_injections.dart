import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:get_it/get_it.dart';

import '../../layers/data/datasources/cache/user_biometric_datasource_imp.dart';

registerDatasourcesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginDataSource>(
    () => UserRecoverLoginDataSourceImp(),
  );
  getIt.registerFactory<UserBiometricsDataSource>(
    () => UserBiometricsDatasourceImp(getIt.get<CacheStorage>()),
  );
}
