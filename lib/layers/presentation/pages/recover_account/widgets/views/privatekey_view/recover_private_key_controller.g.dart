// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_private_key_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverPrivateKeyController on RecoverPrivateKeyControllerBase, Store {
  Computed<bool>? _$isPrivateKeyValidComputed;

  @override
  bool get isPrivateKeyValid => (_$isPrivateKeyValidComputed ??= Computed<bool>(
          () => super.isPrivateKeyValid,
          name: 'RecoverPrivateKeyControllerBase.isPrivateKeyValid'))
      .value;

  final _$currentPrivateKeyAtom =
      Atom(name: 'RecoverPrivateKeyControllerBase.currentPrivateKey');

  @override
  String get currentPrivateKey {
    _$currentPrivateKeyAtom.reportRead();
    return super.currentPrivateKey;
  }

  @override
  set currentPrivateKey(String value) {
    _$currentPrivateKeyAtom.reportWrite(value, super.currentPrivateKey, () {
      super.currentPrivateKey = value;
    });
  }

  final _$isValidatingAtom =
      Atom(name: 'RecoverPrivateKeyControllerBase.isValidating');

  @override
  bool get isValidating {
    _$isValidatingAtom.reportRead();
    return super.isValidating;
  }

  @override
  set isValidating(bool value) {
    _$isValidatingAtom.reportWrite(value, super.isValidating, () {
      super.isValidating = value;
    });
  }

  final _$privateKeyFieldStateAtom =
      Atom(name: 'RecoverPrivateKeyControllerBase.privateKeyFieldState');

  @override
  PrivateKeyFieldState get privateKeyFieldState {
    _$privateKeyFieldStateAtom.reportRead();
    return super.privateKeyFieldState;
  }

  @override
  set privateKeyFieldState(PrivateKeyFieldState value) {
    _$privateKeyFieldStateAtom.reportWrite(value, super.privateKeyFieldState,
        () {
      super.privateKeyFieldState = value;
    });
  }

  final _$onPrivateKeyChangedAsyncAction =
      AsyncAction('RecoverPrivateKeyControllerBase.onPrivateKeyChanged');

  @override
  Future<void> onPrivateKeyChanged(
      String value, String username, Function loadingCallBack) {
    return _$onPrivateKeyChangedAsyncAction
        .run(() => super.onPrivateKeyChanged(value, username, loadingCallBack));
  }

  final _$validatePrivateKeyAsyncAction =
      AsyncAction('RecoverPrivateKeyControllerBase.validatePrivateKey');

  @override
  Future<void> validatePrivateKey(
      String value, String username, Function loadingCallBack) {
    return _$validatePrivateKeyAsyncAction
        .run(() => super.validatePrivateKey(value, username, loadingCallBack));
  }

  final _$saveUserOnCacheAsyncAction =
      AsyncAction('RecoverPrivateKeyControllerBase.saveUserOnCache');

  @override
  Future<void> saveUserOnCache(UserEntity user) {
    return _$saveUserOnCacheAsyncAction.run(() => super.saveUserOnCache(user));
  }

  final _$onValidatePrivateKeySuccessAsyncAction = AsyncAction(
      'RecoverPrivateKeyControllerBase.onValidatePrivateKeySuccess');

  @override
  Future<void> onValidatePrivateKeySuccess(String value, UserEntity user) {
    return _$onValidatePrivateKeySuccessAsyncAction
        .run(() => super.onValidatePrivateKeySuccess(value, user));
  }

  final _$RecoverPrivateKeyControllerBaseActionController =
      ActionController(name: 'RecoverPrivateKeyControllerBase');

  @override
  void onValidatePrivateKeyFailure(DomainError error) {
    final _$actionInfo =
        _$RecoverPrivateKeyControllerBaseActionController.startAction(
            name:
                'RecoverPrivateKeyControllerBase.onValidatePrivateKeyFailure');
    try {
      return super.onValidatePrivateKeyFailure(error);
    } finally {
      _$RecoverPrivateKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePrivateKeyFieldState(PrivateKeyFieldState state) {
    final _$actionInfo =
        _$RecoverPrivateKeyControllerBaseActionController.startAction(
            name: 'RecoverPrivateKeyControllerBase.updatePrivateKeyFieldState');
    try {
      return super.updatePrivateKeyFieldState(state);
    } finally {
      _$RecoverPrivateKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPrivateKey: ${currentPrivateKey},
isValidating: ${isValidating},
privateKeyFieldState: ${privateKeyFieldState},
isPrivateKeyValid: ${isPrivateKeyValid}
    ''';
  }
}
