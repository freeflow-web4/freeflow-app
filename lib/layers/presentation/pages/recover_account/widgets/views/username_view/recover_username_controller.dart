import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/domain/validators/username_validator/username_validator.dart';
import 'package:mobx/mobx.dart';

part 'recover_username_controller.g.dart';

enum UsernameFieldState {
  initial,
  empty,
  valid,
  invalid,
  wrong,
  connectionError
}

class RecoverUsernameController = RecoverUsernameControllerBase
    with _$RecoverUsernameController;

abstract class RecoverUsernameControllerBase with Store {
  RecoverUsernameControllerBase({
    required this.validator,
    required this.getUsernameExistsUsecase,
  });
  final UsernameValidator validator;
  final GetUsernameExistsUsecase getUsernameExistsUsecase;

  @observable
  String currentUsername = "";

  @observable
  UsernameFieldState usernameFieldState = UsernameFieldState.initial;

  @observable
  bool isValidating = false;

  @computed
  bool get isNameValid => usernameFieldState == UsernameFieldState.valid;

  @action
  Future<void> onUsernameChanged(
    String value,
    Function errorCallBack,
    Function loadingCallBack,
  ) async {
    validateUsername(value, errorCallBack, loadingCallBack);
  }

  @action
  Future<void> validateUsername(
    String value,
    Function errorCallBack,
    Function loadingCallBack,
  ) async {
    loadingCallBack();
    isValidating = true;
    final _isNameValid = validator(value);
    if (_isNameValid) {
      final result = await getUsernameExistsUsecase(value);
      result.fold(
        (error) {
          onValidateUsernameFailure(error, errorCallBack);
        },
        (success) {
          if (success) {
            onValidateUsernameSuccess(value);
          } else {
            updateUsernameFieldState(UsernameFieldState.invalid);
          }
        },
      );
    } else {
      updateUsernameFieldState(UsernameFieldState.empty);
    }
    isValidating = false;
  }

  @action
  void onValidateUsernameSuccess(String value) {
    updateUsernameFieldState(UsernameFieldState.valid);
    currentUsername = value;
  }

  @action
  void onValidateUsernameFailure(DomainError error, Function errorCallBack) {
    updateUsernameFieldState(UsernameFieldState.invalid);
    if (error == DomainError.noInternet) {
      errorCallBack();
    }
  }

  @action
  void updateUsernameFieldState(UsernameFieldState state) {
    usernameFieldState = state;
  }
}
