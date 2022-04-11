import 'package:freeflow/layers/data/datasources/cache/user_local_auth_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/cache/user_pincode_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/remote/wallet_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/remote/user_recover_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/remote/username_exists_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:get_it/get_it.dart';

import '../../layers/data/datasources/cache/user_biometric_datasource_imp.dart';

registerDatasourcesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginDataSource>(
    () => UserRecoverLoginDataSourceImp(getIt.get<HttpClient>()),
  );
  getIt.registerFactory<UserBiometricsDataSource>(
    () => UserBiometricsDatasourceImp(getIt.get<CacheStorage>()),
  );
  getIt.registerFactory<UserPincodeDatasource>(
    () => UserPincodeDatasourceImp(getIt.get<CacheStorage>()),
  );

  getIt.registerFactory<UsernameExistsDatasource>(
    () => UsernameExistsDatasourceImp(getIt.get<HttpClient>()),
  );
  getIt.registerFactory<UserLocalAuthDatasource>(
    () => UserLocalAuthDatasourceImp(getIt.get<CacheStorage>()),
  );
  getIt.registerFactory<WalletDatasource>(
    () => WalletDatasourceImp(getIt.get<HttpClient>()),
  );
}
