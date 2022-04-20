import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/pin_code_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/validators/name_validator.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_pin_code_controller.g.dart';

class CreateWalletPinCodeController = _CreateWalletPinCodeControllerBase
    with _$CreateWalletPinCodeController;

abstract class _CreateWalletPinCodeControllerBase with Store {
  final BiometricAuthDriver biometricDriver;
  final PinValidator pinValidator;

  _CreateWalletPinCodeControllerBase({
    required this.biometricDriver,
    required this.pinValidator,
  });

  @observable
  GradientTextFieldState pinFieldState = GradientTextFieldState.empty;

  @computed
  bool get formValid => GradientTextFieldState.valid == pinFieldState;

  @computed
  bool get isGradientTextFieldValid =>
      GradientTextFieldState.invalid != pinFieldState;

  @observable
  bool isPinObscure = true;

  @observable
  bool rememberMe = false;

  @observable
  String currentPinCode = "";

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }

  @action
  void onPinChanged(String value) {
    final isPinValid = pinValidator(value);
    if (isPinValid) {
      pinFieldState = GradientTextFieldState.valid;
      currentPinCode = value;
    } else {
      pinFieldState = GradientTextFieldState.invalid;
    }
  }

  @action
  void _updateCurrentPinCode(String value) {
    currentPinCode = value;
  }

  @action
  void onNextButtonPressed(
    void Function(PinCodeFormModel pinCodeFormModel) onValid,
    void Function() onInvalid,
  ) {
    if (formValid) {
      onValid(getPinCodeFormModel());
    } else {
      onInvalid();
    }
  }

  @action
  Future<void> biometricAuth(bool value) async {
    if (value) {
      final biometricResult = await biometricDriver.authenticateUser();
      biometricResult.fold(
        (l) => setRememberMe(false),
        (r) => setRememberMe(r),
      );
    } else {
      setRememberMe(false);
    }
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }

  @action
  void onRememberMeChanged(bool value) {
    biometricAuth(value);
  }

  void onKeyboardTap(String digit) {
    String nextCurrentText = '';
    if (digit == 'del') {
      final end = currentPinCode.length - 1 < 0 ? 0 : currentPinCode.length - 1;
      nextCurrentText = currentPinCode.substring(0, end);
    } else if (digit == 'X') {
      nextCurrentText = '';
    } else {
      if (currentPinCode.length >= 4) {
        return;
      }
      nextCurrentText = currentPinCode + digit;
    }
    onPinChanged(nextCurrentText);

    _updateCurrentPinCode(nextCurrentText);
  }

  PinCodeFormModel getPinCodeFormModel() {
    return PinCodeFormModel(
      pinCode: currentPinCode,
      saveBiometrics: rememberMe,
    );
  }
}
