import 'package:freeflow/layers/domain/validators/pin_validator.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

enum PinFieldState { empty, valid, invalid }

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final PinValidator pinValidator;

  AuthControllerBase(this.pinValidator);

  @observable
  String? pinErrorMessage;

  @observable
  PinFieldState pinFieldState = PinFieldState.empty;

  @computed
  bool get isPinValid => pinFieldState == PinFieldState.valid;

  @action
  void onPinChanged(String value) {
    final isPinValid = pinValidator(value);
    if (isPinValid) {
      pinFieldState = PinFieldState.valid;
    } else {
      pinFieldState = PinFieldState.invalid;
    }
  }
}
