import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:mobx/mobx.dart';
part 'create_wallet_private_key_show_state_controller.g.dart';

class CreateWalletPrivateKeyShowStateController = _CreateWalletEmailControllerBase
    with _$CreateWalletPrivateKeyShowStateController;

abstract class _CreateWalletEmailControllerBase with Store {
  @observable
  GradientTextFieldState gradientTextFieldState = GradientTextFieldState.empty;

  @observable
  bool buttonNextActivated = false;

  @action
  void setButtonEnabled() {
    buttonNextActivated = true;
  }

  @action
  void onNextButtonPressed(
    void Function() onValid,
    void Function() onInvalid,
  ) {
    if (buttonNextActivated) {
      onValid();
    } else {
      onInvalid();
    }
  }
}
