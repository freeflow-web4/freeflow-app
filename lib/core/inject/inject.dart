import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/data/repositories/user_login_repository_imp.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase_imp.dart';
import 'package:freeflow/layers/presentation/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // datasources
    getIt.registerLazySingleton<UserLoginDataSource>(
      () => UserLoginDataSourceImp(),
    );

    // repositories
    getIt.registerLazySingleton<UserLoginRepository>(
      () => UserLoginRepositoryImp(getIt()),
    );

    // usecases
    getIt.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCaseImp(getIt()),
    );

    // controllers
    getIt.registerFactory<UserController>(
      () => UserController(
        getIt(),
      ),
    ); //Factory creates a new instance of the object
  }
}
