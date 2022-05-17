import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:mobx/mobx.dart';
part 'create_wallet_private_key_confirm_controller.g.dart';

class CreateWalletPrivateKeyConfirmController = _CreateWalletEmailControllerBase
    with _$CreateWalletPrivateKeyConfirmController;

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

  String correctPrivateKey;

  _CreateWalletEmailControllerBase(this.correctPrivateKey);

  @action
  void onPrivateKeyChanged(String value) {
    if (value.trim().isEmpty) {
      gradientTextFieldState = GradientTextFieldState.empty;
    } else if (isPrivateKeyValid(value)) {
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

  bool isPrivateKeyValid(
    String privateKey,
  ) {
    final words = privateKey.split(' ');
    if (words.length != 3) return false;
    final correctPrivateKeyWords = correctPrivateKey.split(' ');
    return words.every((word) => correctPrivateKeyWords.contains(word));
  }
}
