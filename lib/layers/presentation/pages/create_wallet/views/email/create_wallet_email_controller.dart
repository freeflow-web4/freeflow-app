import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/email_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_email_controller.g.dart';

class CreateWalletEmailController = _CreateWalletEmailControllerBase
    with _$CreateWalletEmailController;

abstract class _CreateWalletEmailControllerBase with Store {
  @observable
  GradientTextFieldState privateKeyFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated =>
      GradientTextFieldState.valid == privateKeyFieldState;

  @computed
  bool get isEmailValid =>
      GradientTextFieldState.invalid != privateKeyFieldState;

  @observable
  bool formValid = false;

  @observable
  String currentEmail = '';

  @action
  void onEmailChanged(String value) {
    if (value.trim().isEmpty) {
      privateKeyFieldState = GradientTextFieldState.empty;
    } else if (CreateWalletEmailValidator.isValid(value)) {
      privateKeyFieldState = GradientTextFieldState.valid;
      formValid = true;
      currentEmail = value;
    } else {
      privateKeyFieldState = GradientTextFieldState.invalid;
      formValid = false;
    }
  }

  @action
  void onNextButtonPressed(
    void Function(EmailFormEntity email) onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid(getEmailFormModel());
    } else {
      onInvalid();
    }
  }

  EmailFormEntity getEmailFormModel() {
    return EmailFormEntity(
      email: currentEmail,
    );
  }
}
