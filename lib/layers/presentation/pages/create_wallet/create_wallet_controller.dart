import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:mobx/mobx.dart';
part 'create_wallet_controller.g.dart';

class CreateWalletController = _CreateWalletControllerBase
    with _$CreateWalletController;

abstract class _CreateWalletControllerBase with Store {


  @observable
  GradientTextFieldState gradientTextFieldState = GradientTextFieldState.empty;

  @computed
  bool get buttonNextActivated => GradientTextFieldState.valid == gradientTextFieldState;
  
  @computed
  bool get isGradientTextFieldValid => GradientTextFieldState.invalid != gradientTextFieldState;

  @action
  void onEmailChanged(String value) {
    if (value.trim().isEmpty) {
      gradientTextFieldState = GradientTextFieldState.empty;
    } 
    else if (value.trim().length < 6) {
      gradientTextFieldState = GradientTextFieldState.invalid;
    } else {
      gradientTextFieldState = GradientTextFieldState.valid;
    }
  }
}
