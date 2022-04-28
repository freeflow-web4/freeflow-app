import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_flower_name_controller.g.dart';

class CreateWalletFlowerNameController = _CreateWalletEmailControllerBase
    with _$CreateWalletFlowerNameController;

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

  @observable
  String currentFlowerName = '';

  @action
  void onFlowerNameChanged(String value) {
    if (value.trim().isEmpty) {
      gradientTextFieldState = GradientTextFieldState.empty;
    } else if (CreateWalletNameValidator.isValid(value)) {
      gradientTextFieldState = GradientTextFieldState.valid;
      formValid = true;
      currentFlowerName = value;
    } else {
      gradientTextFieldState = GradientTextFieldState.invalid;
      formValid = false;
    }
  }

  @action
  void onNextButtonPressed(
    void Function(FlowerNameFormEntity flowerNameForm) onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid(getFlowerNameFormModel());
    } else {
      onInvalid();
    }
  }

  FlowerNameFormEntity getFlowerNameFormModel() {
    return FlowerNameFormEntity(
      flowerName: currentFlowerName,
    );
  }
}
