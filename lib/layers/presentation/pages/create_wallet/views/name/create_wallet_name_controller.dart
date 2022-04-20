import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_name_controller.g.dart';

class CreateWalletNameController = _CreateWalletControllerBase
    with _$CreateWalletNameController;

abstract class _CreateWalletControllerBase with Store {
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
  String currentName = "";

  @action
  void onNameChanged(String value) {
    if (value.trim().isEmpty) {
      nameFieldState = GradientTextFieldState.empty;
    } else if (CreateWalletNameValidator.isValid(value)) {
      nameFieldState = GradientTextFieldState.valid;
      formValid = true;
      currentName = value;
    } else {
      nameFieldState = GradientTextFieldState.invalid;
      formValid = false;
    }
  }

  @action
  void onNextButtonPressed(
    void Function(NameFormEntity nameFormModel) onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid(getNameFormModel());
    } else {
      onInvalid();
    }
  }

  NameFormEntity getNameFormModel() {
    return NameFormEntity(
      name: currentName,
    );
  }
}
