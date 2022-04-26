import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator.dart';
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
    required this.saveUserLocalAuthUsecase,
  });

  final PrivateKeyValidator validator;
  final UserRecoverLoginUseCase userRecoverLoginUseCase;
  final SaveUserLocalAuthUsecase saveUserLocalAuthUsecase;

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
      (r) async {
        await onValidatePrivateKeySuccess(key, r);
      },
    );
    isValidating = false;
  }

  @action
  Future<void> saveUserOnCache(UserEntity user) async =>
      await saveUserLocalAuthUsecase(user);

  @action
  Future<void> onValidatePrivateKeySuccess(
    String value,
    UserEntity user,
  ) async {
    await saveUserOnCache(user);
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
