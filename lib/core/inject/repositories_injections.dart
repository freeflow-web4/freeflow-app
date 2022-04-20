import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_create_wallet_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:freeflow/layers/data/repositories/user_biometrics_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_create_wallet_repository_impl.dart';
import 'package:freeflow/layers/data/repositories/user_local_auth_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_pincode_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/data/repositories/username_exists_repository_imp.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_create_wallet_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
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
}
