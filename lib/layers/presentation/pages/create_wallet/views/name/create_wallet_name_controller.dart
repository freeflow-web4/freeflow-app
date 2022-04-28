import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
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
  bool get buttonNextActivated => formValid && !isLoading;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.invalid != nameFieldState;

  @observable
  bool formValid = false;

  @observable
  String currentName = "";

  @observable
  bool isLoading = false;

  @action
  Future<void> onNameChanged({
    required String value,
    required void Function() onLoadingStarted,
    required void Function() onLoadingFinished,
  }) async {
    if (value == currentName) {
      return;
    }
    if (value.trim().isEmpty) {
      nameFieldState = GradientTextFieldState.empty;
      isLoading = false;
      currentName = value;
    } else if (CreateWalletNameValidator.isValid(value)) {
      isLoading = true;
      currentName = value;
      onLoadingStarted();
      getUsernameExistsUsecase(value).then(
        (result) => result.fold((l) {
          nameFieldState = GradientTextFieldState.invalid;
          formValid = false;
          isLoading = false;
          onLoadingFinished();
        }, (r) {
          if (!r) {
            nameFieldState = GradientTextFieldState.valid;
            formValid = true;
            isLoading = false;
          } else {
            nameFieldState = GradientTextFieldState.invalid;
            formValid = false;
            isLoading = false;
          }
          onLoadingFinished();
        }),
      );
    } else {
      nameFieldState = GradientTextFieldState.invalid;
      formValid = false;
      isLoading = false;
      currentName = value;
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
