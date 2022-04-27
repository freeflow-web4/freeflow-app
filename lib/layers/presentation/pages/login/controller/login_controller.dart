import 'package:freeflow/layers/domain/usecases/user_has_pincode/user_has_pincode_usecase.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

LoginController findLoginController() => GetIt.I.get<LoginController>();

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  Future<void> onSwipe() {
    return Routes.instance.goToFreeflowLogoLoadingRoute(
      () async {
        final userHasPinCodeUsecase = GetIt.I.get<UserHasPinCodeUsecase>();
        final hasPinCodeResult = await userHasPinCodeUsecase();
        hasPinCodeResult.fold((l) => null, (hasPinCode) {
          if (hasPinCode) {
            Routes.instance.goToAuthPageRoute();
          } else {
            Routes.instance.goToCreateWalletPageRoute();
          }
        });
      },
    );
  }
}
