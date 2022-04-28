import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/presentation/pages/auth/login.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/update_pincode_view.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

enum PinFieldState { empty, valid, invalid, wrong }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store, Login {
  final PinValidator pinValidator;
  UserSetPincodeUsecase userSetPincodeUsecase =
      GetIt.I.get<UserSetPincodeUsecase>();

  AuthControllerBase(this.pinValidator);

  @observable
  String currentPinCode = "";

  @observable
  PinFieldState pinFieldState = PinFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == PinFieldState.valid;

  @observable
  bool isPinObscure = true;

  @observable
  UpdatePincodeState updatePincodeState =
      UpdatePincodeState.enterCurrentPinCode;

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
      () => updatePinFieldState(PinFieldState.wrong),
      () => updatePinFieldState(PinFieldState.invalid),
    );
  }

  void nextPage() {
    Routes.instance.goToHomePageRoute();
  }

  @action
  void onPinChanged(String value) {
    final isPinValid = pinValidator(value);
    if (isPinValid) {
      pinFieldState = PinFieldState.valid;
    } else {
      pinFieldState = PinFieldState.invalid;
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
  void updatePinFieldState(PinFieldState state) {
    pinFieldState = state;
  }

  @action
  void pinCodeHasMatch() async {
    final isPinCorrect =
        await GetIt.I.get<UserCheckPinCodeUsecase>().call(currentPinCode);
    isPinCorrect.fold((_) {}, (success) {
      if (success) {
        updatePincodeState = UpdatePincodeState.chooseNewPincode;
        currentPinCode = '';
      } else {
        updatePinFieldState(PinFieldState.wrong);
      }
    });
  }

  @action
  resetPin(){
    currentPinCode = '';
    updatePincodeState = UpdatePincodeState.enterCurrentPinCode;
  }

  @action
  void setNewPincode(String newPincodeAuth) {
    if (newPincodeAuth == currentPinCode) {
      updatePincodeState = UpdatePincodeState.enterCurrentPinCode;
      print('perfeito - salvo - e confirmado');
      userSetPincodeUsecase.call(currentPinCode);
      //todo: set persistent new pincode
      //todo: show dialog
    } else {
      updatePinFieldState(PinFieldState.wrong);
    }
  }
}
