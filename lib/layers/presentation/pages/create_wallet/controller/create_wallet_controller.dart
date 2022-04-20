import 'package:freeflow/layers/presentation/pages/create_wallet/models/create_wallet_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/pin_code_form_model.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_controller.g.dart';

class CreateWalletController = _CreateWalletControllerBase
    with _$CreateWalletController;

abstract class _CreateWalletControllerBase with Store {
  @observable
  double pageIndicatorHeight = 0;

  final CreateWalletFormModel formModel = CreateWalletFormModel();

  String privateKey = '';

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

  void setPrivateKey(String privateKey) {
    this.privateKey = privateKey;
  }

  String getPrivateKey() {
    return privateKey;
  }

  void setPinCode(PinCodeFormModel pinCode) {
    formModel.pinCode = pinCode;
  }

  PinCodeFormModel? getPinCode() {
    return formModel.pinCode;
  }
}
