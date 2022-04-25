import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase.dart';
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

  _CreateWalletControllerBase({
    required this.userSetBiometricsUsecase,
    required this.userCreateWalletUseCase,
  });

  @action
  void updatePageIndicatorHeight(double height) {
    pageIndicatorHeight = height;
  }

  //TODO: remove
  int getCurrentPageIndicatorIndex(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 0;
      default:
        throw Exception('Invalid page index');
    }
  }

  void setName(NameFormEntity name) {
    formModel.nameFormModel = name;
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

  void onCreationFinisehd(void Function(DialogType) onError) async {
    if (pinCode?.saveBiometrics == true) {
      userSetBiometricsUsecase(true);
    }
    final result = await userCreateWalletUseCase(formModel.toEntity());
    result.fold(
      (error) {
        switch (error) {
          case DomainError.noInternet:
            onError(DialogType.noInternetConnection);
            break;
          default:
            onError(DialogType.systemInstability);
        }
      },
      (r) => Routes.instance.goToWelcomePageRoute(),
    );
  }
}
