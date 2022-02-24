import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:get_it/get_it.dart';

registerDatasourcesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginDataSource>(
    () => UserRecoverLoginDataSourceImp(),
  );
}
