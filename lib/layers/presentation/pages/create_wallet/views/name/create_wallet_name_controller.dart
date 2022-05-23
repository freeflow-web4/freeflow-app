import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_name_controller.g.dart';

CreateWalletNameController findCreateWalletNameController() =>
    GetIt.I.get<CreateWalletNameController>();

class CreateWalletNameController = _CreateWalletControllerBase
    with _$CreateWalletNameController;

abstract class _CreateWalletControllerBase with Store {
  final GetUsernameExistsUsecase getUsernameExistsUsecase;

  _CreateWalletControllerBase(this.getUsernameExistsUsecase);

  @observable
  GradientTextFieldState nameFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated => formValid;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.invalid != nameFieldState;

  @observable
  bool formValid = false;

  @observable
  String currentName = "";

  @action
  Future<void> onNameChanged({required String value}) async {
    if (value.trim().isEmpty) {
      currentName = value;
      nameFieldState = GradientTextFieldState.empty;
      formValid = false;
    } else {
      currentName = value;
      nameFieldState = GradientTextFieldState.valid;
      formValid = true;
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
