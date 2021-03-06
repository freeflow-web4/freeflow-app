import 'package:freeflow/layers/data/datasources/user_private_key_datasource.dart';
import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/data/datasources/collectibles_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_create_wallet_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_profile_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:freeflow/layers/data/repositories/user_private_key_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/cache_repository.dart';
import 'package:freeflow/layers/data/repositories/wallet_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/collectibles_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_biometrics_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_create_wallet_repository_impl.dart';
import 'package:freeflow/layers/data/repositories/user_local_auth_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_pincode_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_profile_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/username_exists_repository_imp.dart';
import 'package:freeflow/layers/domain/repositories/user_private_key_repository.dart';
import 'package:freeflow/layers/domain/repositories/cache_repository.dart';
import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';
import 'package:freeflow/layers/domain/repositories/collectibles_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_create_wallet_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:get_it/get_it.dart';

registerRepositoriesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginRepository>(
    () =>
        UserRecoverLoginRepositoryImp(getIt.get<UserRecoverLoginDataSource>()),
  );
  getIt.registerFactory<UserBiometricsRepository>(
    () => UserBiometricsRepositoryImp(getIt.get<UserBiometricsDataSource>()),
  );
  getIt.registerFactory<UserPincodeRepository>(
    () => UserPincodeRepositoryImp(getIt.get<UserPincodeDatasource>()),
  );
  getIt.registerFactory<UsernameExistsRepository>(
    () => UsernameExistsRepositoryImp(getIt.get<UsernameExistsDatasource>()),
  );
  getIt.registerFactory<UserLocalAuthRepository>(
    () => UserLocalAuthRepositoryImp(getIt.get<UserLocalAuthDatasource>()),
  );
  getIt.registerFactory<UserCreateWalletRepository>(
    () =>
        UserCreateWalletRepositoryImpl(getIt.get<UserCreateWalletDataSource>()),
  );
  getIt.registerFactory<WalletRepository>(
    () => WalletRepositoryImp(getIt.get<WalletDatasource>()),
  );
  getIt.registerFactory<UserProfileRepository>(
    () => UserProfileRepositoryImp(getIt.get<UserProfileDataSource>()),
  );
  getIt.registerFactory<CollectiblesRepository>(
    () => CollectiblesRepositoryImp(getIt.get<CollectiblesDataSource>()),
  );
  getIt.registerFactory<UserPrivateKeyRepository>(
    () => UserPrivateKeyRepositoryImp(getIt.get<UserPrivateKeyDatasource>()),
  );

  getIt.registerFactory<CacheRepository>(
    () => CacheRepositoryImpl(getIt.get<CacheStorage>()),
  );
}
