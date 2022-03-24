import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator.dart';
import 'package:freeflow/layers/domain/validators/username_validator/username_validator.dart';
import 'package:mobx/mobx.dart';

part 'recover_private_key_controller.g.dart';

enum PrivateKeyFieldState {
  initial,
  empty,
  valid,
  invalid,
  wrong,
  connectionError
}

class RecoverPrivateKeyController = RecoverPrivateKeyControllerBase
    with _$RecoverPrivateKeyController;

abstract class RecoverPrivateKeyControllerBase with Store {
  RecoverPrivateKeyControllerBase({
    required this.validator,
    required this.userRecoverLoginUseCase,
  });

  final PrivateKeyValidator validator;
  final UserRecoverLoginUseCase userRecoverLoginUseCase;

  @observable
  String currentPrivateKey = "";

  @observable
  bool isValidating = false;

  @observable
  PrivateKeyFieldState privateKeyFieldState = PrivateKeyFieldState.initial;

  @computed
  bool get isPrivateKeyValid =>
      privateKeyFieldState == PrivateKeyFieldState.valid;

  @action
  Future<void> onPrivateKeyChanged(
    String value,
    String username,
    Function loadingCallBack,
  ) async {
    if (value.isEmpty) {
      privateKeyFieldState = PrivateKeyFieldState.empty;
      return;
    }
    validatePrivateKey(value, username, loadingCallBack);
  }

  @action
  Future<void> validatePrivateKey(
    String value,
    String username,
    Function loadingCallBack,
  ) async {
    loadingCallBack();
    isValidating = true;
    final _isPrivateKeyValid = validator(value);
    if (_isPrivateKeyValid) {
      auth(username: username, key: value);
    } else {
      updatePrivateKeyFieldState(PrivateKeyFieldState.invalid);
    }
  }

  Future<void> auth({required String username, required String key}) async {
    final result = await userRecoverLoginUseCase(
      username: username,
      privateKey: key,
    );
    result.fold(
      (l) {
        onValidatePrivateKeyFailure(l);
      },
      (r) {
        onValidatePrivateKeySuccess(key);
      },
    );
    isValidating = false;
  }

  @action
  void onValidatePrivateKeySuccess(String value) {
    updatePrivateKeyFieldState(PrivateKeyFieldState.valid);
    currentPrivateKey = value;
  }

  @action
  void onValidatePrivateKeyFailure(DomainError error) {
    updatePrivateKeyFieldState(PrivateKeyFieldState.invalid);
  }

  @action
  void updatePrivateKeyFieldState(PrivateKeyFieldState state) {
    privateKeyFieldState = state;
  }
}
