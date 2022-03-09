import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:get_it/get_it.dart';

registerRepositoriesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginRepository>(
    () => UserRecoverLoginRepositoryImp(
        GetIt.I.get<UserRecoverLoginDataSource>()),
  );
}
