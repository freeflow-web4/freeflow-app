import 'package:auto_route/auto_route.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_page.dart';
import 'package:freeflow/layers/presentation/pages/home/home_page.dart';
import 'package:freeflow/layers/presentation/pages/login/login_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart';
import 'package:freeflow/layers/presentation/pages/welcome/welcome_page.dart';
import 'package:freeflow/layers/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: RecoverAccountLoadingPage),
    AutoRoute(page: RecoverAccountPage),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RecoverAccountLoadingPage),
    AutoRoute(page: RecoverAccountPage),
    AutoRoute(page: AuthPage),
    AutoRoute(page: HomePage),
  ],
)
// extend the generated private router
class $RootRouter {}
