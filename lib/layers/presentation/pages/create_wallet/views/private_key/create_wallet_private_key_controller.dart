import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_private_key_controller.g.dart';

class CreateWalletPrivateKeyController = _CreateWalletEmailControllerBase
    with _$CreateWalletPrivateKeyController;

abstract class _CreateWalletEmailControllerBase with Store {
  @observable
  GradientTextFieldState gradientTextFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated =>
      GradientTextFieldState.valid == gradientTextFieldState;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.invalid != gradientTextFieldState;

  @observable
  bool formValid = false;

  @action
  void onFlowerNameChanged(String value) {
    if (value.trim().isEmpty) {
      gradientTextFieldState = GradientTextFieldState.empty;
    } else if (CreateWalletNameValidator.isValid(value)) {
      gradientTextFieldState = GradientTextFieldState.valid;
      formValid = true;
    } else {
      gradientTextFieldState = GradientTextFieldState.invalid;
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
