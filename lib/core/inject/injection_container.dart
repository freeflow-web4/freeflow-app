import 'package:freeflow/core/inject/controllers_injections.dart';

import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;
    registerControllerDependencies(getIt);
  }
}
