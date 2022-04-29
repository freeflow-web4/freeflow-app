import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/presentation/pages/auth/login.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/update_pincode_view.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store, Login {
  final PinValidator pinValidator;
  UserSetPincodeUsecase userSetPincodeUsecase =
      GetIt.I.get<UserSetPincodeUsecase>();

  AuthControllerBase(this.pinValidator);

  @observable
  String currentPinCode = "";

  @observable
  GradientTextFieldState pinFieldState = GradientTextFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == GradientTextFieldState.valid;

  @observable
  bool isPinObscure = true;

  @observable
  RecoverPincodeState recoverPincodeState = RecoverPincodeState.authentication;

  @action
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
      currentPin,
      () => onLoginSuccess(loginAnimationCallBack),
      () => updatePinFieldState(GradientTextFieldState.wrong),
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
    if (digit == 'del') {
      final end = currentPinFieldText.length - 1 < 0
          ? 0
          : currentPinFieldText.length - 1;
      nextCurrentText = currentPinFieldText.substring(0, end);
    } else if (digit == 'X') {
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

  @action
  Future<void> pinCodeHasMatch() async {
    final isPinCorrect =
        await GetIt.I.get<UserCheckPinCodeUsecase>().call(currentPinCode);
     
    isPinCorrect.fold((_) {}, (success) {
      if (success) {
        recoverPincodeState = RecoverPincodeState.chooseNewPincode;
        currentPinCode = '';
      } else {
        updatePinFieldState(GradientTextFieldState.wrong);
      }
    });
  }

  @action
  void clearPinData() {
    currentPinCode = '';
    recoverPincodeState = RecoverPincodeState.authentication;
  }

  @action
  Future<void> setNewPincode(String newAuthenticationPinCode) async {
    if (newAuthenticationPinCode == currentPinCode) {
      final response = await userSetPincodeUsecase.call(currentPinCode);
      response.fold(
        (error) {
          recoverPincodeState = RecoverPincodeState.error;
        },
        (success) {
          recoverPincodeState = RecoverPincodeState.changeCompleted;
        },
      );
    } else {
      updatePinFieldState(GradientTextFieldState.wrong);
    }
  }
}
