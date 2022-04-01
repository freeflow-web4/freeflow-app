import 'package:auto_route/auto_route.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/create_wallet_page.dart';
import 'package:freeflow/layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart';
import 'package:freeflow/layers/presentation/pages/home/home_page.dart';
import 'package:freeflow/layers/presentation/pages/login/login_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:freeflow/layers/presentation/pages/welcome/welcome_page.dart';
import 'package:freeflow/layers/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage),
    AutoRoute(page: SplashPage, initial:  true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: FreeflowLogoLoadingPage),
    AutoRoute(page: RecoverAccountPage),
    AutoRoute(page: AuthPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: CreateWalletPage),
  ],
)
// extend the generated private router
class $RootRouter {}
