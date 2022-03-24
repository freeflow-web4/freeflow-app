import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
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
  });

  final PrivateKeyValidator validator;

  @observable
  String currentPrivateKey = "";

  @observable
  PrivateKeyFieldState privateKeyFieldState = PrivateKeyFieldState.initial;

  @computed
  bool get isPrivateKeyValid =>
      privateKeyFieldState == PrivateKeyFieldState.valid;

  @action
  Future<void> onPrivateKeyChanged(
    String value,
  ) async {
    validatePrivateKey(value);
  }

  @action
  Future<void> validatePrivateKey(String value) async {
    final _isPrivateKeyValid = validator(value);
    if (_isPrivateKeyValid) {
      onValidatePrivateKeySuccess(value);
    } else {
      updatePrivateKeyFieldState(PrivateKeyFieldState.invalid);
    }
  }

  @action
  void onValidatePrivateKeySuccess(String value) {
    updatePrivateKeyFieldState(PrivateKeyFieldState.valid);
    currentPrivateKey = value;
  }

  @action
  void onValidatePrivateKeyFailure(DomainError error, Function errorCallBack) {
    updatePrivateKeyFieldState(PrivateKeyFieldState.invalid);
    if (error == DomainError.noInternet) {
      errorCallBack();
    }
  }

  @action
  void updatePrivateKeyFieldState(PrivateKeyFieldState state) {
    privateKeyFieldState = state;
  }
}
