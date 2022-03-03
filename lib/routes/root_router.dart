import 'package:auto_route/auto_route.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_page.dart';
import 'package:freeflow/layers/presentation/pages/login/login_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart';
import 'package:freeflow/layers/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RecoverAccountLoadingPage),
    AutoRoute(page: RecoverAccountPage),
    AutoRoute(page: AuthPage),
  ],
)
// extend the generated private router
class $RootRouter {}
