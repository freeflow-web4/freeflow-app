import 'package:auto_route/auto_route.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page.dart';
import 'package:freeflow/layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomePage, initial: true),
    AutoRoute(
      page: RecoverAccountLoadingPage,
      initial: true,
    ),
    AutoRoute(page: RecoverAccountPage),
  ],
)
// extend the generated private router
class $RootRouter {}
