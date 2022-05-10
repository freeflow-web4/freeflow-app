import 'package:flutter/cupertino.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/helpers/errors/user_create_wallet_error.dart';
import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/create_wallet_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/pin_code_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/private_key_form_model.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_controller.g.dart';

class CreateWalletController = _CreateWalletControllerBase
    with _$CreateWalletController;

abstract class _CreateWalletControllerBase with Store {
  @observable
  double pageIndicatorHeight = 0;

  final CreateWalletFormModel formModel = CreateWalletFormModel();

  PinCodeFormModel? pinCode;

  final UserSetBiometricsUsecase userSetBiometricsUsecase;
  final UserCreateWalletUseCase userCreateWalletUseCase;
  final SaveUserIsLoggedUsecase saveUserIsLoggedUsecase;
  final SaveUserLocalAuthUsecase saveUserLocalAuthUsecase;
  final UserRecoverLoginUseCase userRecoverLoginUseCase;

  _CreateWalletControllerBase({
    required this.userSetBiometricsUsecase,
    required this.userCreateWalletUseCase,
    required this.saveUserIsLoggedUsecase,
    required this.saveUserLocalAuthUsecase,
    required this.userRecoverLoginUseCase,
  });

  @action
  void updatePageIndicatorHeight(double height) {
    pageIndicatorHeight = height;
  }

  void setName(NameFormEntity name) {
    formModel.nameFormModel = name;
  }

  String getName() {
    return formModel.nameFormModel?.name ?? '';
  }

  void setEmail(EmailFormEntity email) {
    formModel.emailFormModel = email;
  }

  void setFlowerName(FlowerNameFormEntity flowerName) {
    formModel.flowerName = flowerName;
  }

  void setPrivateKey(PrivateKeyFormModel privateKey) {
    formModel.privateKeyFormModel = privateKey;
  }

  PrivateKeyFormModel? getPrivateKey() {
    return formModel.privateKeyFormModel;
  }

  void setPinCode(PinCodeFormModel pinCode) {
    this.pinCode = pinCode;
  }

  PinCodeFormModel? getPinCode() {
    return pinCode;
  }

  void loginUser({required String username, required String privateKey}) async {
    final result = await userRecoverLoginUseCase(
      username: username,
      privateKey: privateKey,
    );
    result.fold(
      (l) => null,
      (r) => goToWelcomePage(),
    );
  }

  void goToWelcomePage() => Routes.instance.goToWelcomePageRoute();

  void onCreationFinisehd(
    void Function(DialogType) onError,
  ) async {
    if (pinCode?.saveBiometrics == true) {
      userSetBiometricsUsecase(true);
    }
    final result = await userCreateWalletUseCase(formModel.toEntity());
    result.fold(
      (error) {
        switch (error.errorType) {
          case UserCreateWalletErrorType.userAlreadyExists:
            onError(DialogType.systemInstability);
            break;
          case UserCreateWalletErrorType.emailNotValid:
            onError(DialogType.systemInstability);
            break;
          case UserCreateWalletErrorType.domainError:
            switch (error.toDomainError()) {
              case DomainError.noInternet:
                onError(DialogType.noInternetConnection);
                break;
              default:
                onError(DialogType.systemInstability);
            }
            break;
          default:
            onError(DialogType.systemInstability);
        }
      },
      (r) {
        loginUser(
          username: formModel.flowerName?.flowerName ?? '',
          privateKey: formModel.privateKeyFormModel?.privateKey ?? '',
        );
      },
    );
  }
}
