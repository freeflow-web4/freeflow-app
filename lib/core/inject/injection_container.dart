import 'package:freeflow/core/inject/controllers_injections.dart';
import 'package:freeflow/core/inject/datasources_injections.dart';
import 'package:freeflow/core/inject/repositories_injections.dart';
import 'package:freeflow/core/inject/usecases_injections.dart';

import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;
    registerControllerDependencies(getIt);
    registerRepositoriesDependencies(getIt);
    registerUsecasesDependencies(getIt);
    registerDatasourcesDependencies(getIt);
  }
}
