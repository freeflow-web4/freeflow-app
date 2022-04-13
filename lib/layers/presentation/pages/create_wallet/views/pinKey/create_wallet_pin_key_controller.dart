import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_pin_key_controller.g.dart';

class CreateWalletPinKeyController = _CreateWalletPinKeyControllerBase
    with _$CreateWalletPinKeyController;

abstract class _CreateWalletPinKeyControllerBase with Store {
  @observable
  GradientTextFieldState nameFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated =>
      GradientTextFieldState.valid == nameFieldState;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.invalid != nameFieldState;

  @observable
  bool formValid = false;

  @observable
  bool isPinObscure = true;

  @action
  void onNameChanged(String value) {
    if (value.trim().isEmpty) {
      nameFieldState = GradientTextFieldState.empty;
    } else if (CreateWalletNameValidator.isValid(value)) {
      nameFieldState = GradientTextFieldState.valid;
      formValid = true;
    } else {
      nameFieldState = GradientTextFieldState.invalid;
      formValid = false;
    }
  }

  @action
  void onNextButtonPressed(
    void Function() onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid();
    } else {
      onInvalid();
    }
  }
}
