import 'package:auto_route/auto_route.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_page.dart';
import 'package:freeflow/layers/presentation/pages/cut_image/cut_image_page.dart';
import 'package:freeflow/layers/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:freeflow/layers/presentation/pages/freeflow_logo_loading/freeflow_logo_loading_page.dart';
import 'package:freeflow/layers/presentation/pages/home/home_page.dart';
import 'package:freeflow/layers/presentation/pages/login/login_page.dart';
import 'package:freeflow/layers/presentation/pages/profile/profile_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_splash/recover_splash_page.dart';
import 'package:freeflow/layers/presentation/pages/welcome/welcome_page.dart';
import 'package:freeflow/layers/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CutImagePage),
    AutoRoute(page: EditProfilePage),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: FreeflowLogoLoadingPage),
    AutoRoute(page: RecoverAccountPage),
    AutoRoute(page: AuthPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: RecoverSplashPage),
  ],
)
// extend the generated private router
class $RootRouter {}
