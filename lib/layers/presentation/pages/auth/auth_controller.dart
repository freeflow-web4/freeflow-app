import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/presentation/pages/auth/login.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store, Login {
  final PinValidator pinValidator;

  AuthControllerBase(this.pinValidator);

  @observable
  String currentPinCode = "";

  @observable
  GradientTextFieldState pinFieldState = GradientTextFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == GradientTextFieldState.valid;

  @observable
  bool isPinObscure = true;

  void updateCurrentPinCode(String value) {
    currentPinCode = value;
  }

  void onLoginSuccess(Function onLoginSuccessCallBack) {
    onLoginSuccessCallBack.call().then((_) {
      nextPage();
    });
  }

  void onLoginWithPin(String currentPin, Function loginAnimationCallBack) {
    loginWithPin(
      pinValidator,
      currentPin,
      () => onLoginSuccess(loginAnimationCallBack),
      () => updatePinFieldState(GradientTextFieldState.wrong),
      () => updatePinFieldState(GradientTextFieldState.invalid),
    );
  }

  void nextPage() {
    Routes.instance.goToHomePageRoute();
  }

  @action
  void onPinChanged(String value) {
    final isPinValid = pinValidator(value);
    if (isPinValid) {
      pinFieldState = GradientTextFieldState.valid;
    } else {
      pinFieldState = GradientTextFieldState.invalid;
    }
  }

  @action
  void onKeyboardTap(String digit, String currentPinFieldText) {
    String nextCurrentText = '';
    if (digit == 'X') {
      final end = currentPinFieldText.length - 1 < 0
          ? 0
          : currentPinFieldText.length - 1;
      nextCurrentText = currentPinFieldText.substring(0, end);
    } else if (digit == 'del') {
      nextCurrentText = '';
    } else {
      if (currentPinFieldText.length >= 4) {
        return;
      }
      nextCurrentText = currentPinFieldText + digit;
    }
    onPinChanged(nextCurrentText);

    updateCurrentPinCode(nextCurrentText);
  }

  @action
  void onPinObscureTextFieldTap() {
    isPinObscure = !isPinObscure;
  }

  @action
  void updatePinFieldState(GradientTextFieldState state) {
    pinFieldState = state;
  }
}
