import 'dart:async';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:mobx/mobx.dart';
part 'create_wallet_flower_name_controller.g.dart';

class CreateWalletFlowerNameController = _CreateWalletEmailControllerBase
    with _$CreateWalletFlowerNameController;

abstract class _CreateWalletEmailControllerBase with Store {
  final GetUsernameExistsUsecase getUsernameExistsUsecase;

  _CreateWalletEmailControllerBase(this.getUsernameExistsUsecase);

  @observable
  GradientTextFieldState gradientTextFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated =>
      GradientTextFieldState.valid == gradientTextFieldState && !isLoading;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.valid == gradientTextFieldState;

  @observable
  bool formValid = false;

  @observable
  String currentFlowerName = '';

  @observable
  bool isLoading = false;

  Timer? debounce;

  @action
  void onFlowerNameChanged(String value) {
    gradientTextFieldState = GradientTextFieldState.typing;
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(const Duration(seconds: 1), () {
      if (value.trim().isEmpty) {
        gradientTextFieldState = GradientTextFieldState.empty;
        isLoading = false;
        currentFlowerName = value;
      } else if (CreateWalletNameValidator.isValid(value)) {
        currentFlowerName = value;
        isLoading = true;
        getUsernameExistsUsecase(value).then(
          (result) => result.fold((l) {
            gradientTextFieldState = GradientTextFieldState.invalid;
            formValid = false;
            isLoading = false;
          }, (r) {
            if (!r) {
              gradientTextFieldState = GradientTextFieldState.valid;
              formValid = true;
              isLoading = false;
            } else {
              gradientTextFieldState = GradientTextFieldState.invalid;
              formValid = false;
              isLoading = false;
            }
          }),
        );
      } else {
        gradientTextFieldState = GradientTextFieldState.invalid;
        formValid = false;
        isLoading = false;
        currentFlowerName = value;
      }
    });
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
