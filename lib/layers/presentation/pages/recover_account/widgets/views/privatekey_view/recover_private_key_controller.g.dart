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
  Future<void> onPrivateKeyChanged(String value) {
    return _$onPrivateKeyChangedAsyncAction
        .run(() => super.onPrivateKeyChanged(value));
  }

  final _$validatePrivateKeyAsyncAction =
      AsyncAction('RecoverPrivateKeyControllerBase.validatePrivateKey');

  @override
  Future<void> validatePrivateKey(String value) {
    return _$validatePrivateKeyAsyncAction
        .run(() => super.validatePrivateKey(value));
  }

  final _$RecoverPrivateKeyControllerBaseActionController =
      ActionController(name: 'RecoverPrivateKeyControllerBase');

  @override
  void onValidatePrivateKeySuccess(String value) {
    final _$actionInfo =
        _$RecoverPrivateKeyControllerBaseActionController.startAction(
            name:
                'RecoverPrivateKeyControllerBase.onValidatePrivateKeySuccess');
    try {
      return super.onValidatePrivateKeySuccess(value);
    } finally {
      _$RecoverPrivateKeyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onValidatePrivateKeyFailure(DomainError error, Function errorCallBack) {
    final _$actionInfo =
        _$RecoverPrivateKeyControllerBaseActionController.startAction(
            name:
                'RecoverPrivateKeyControllerBase.onValidatePrivateKeyFailure');
    try {
      return super.onValidatePrivateKeyFailure(error, errorCallBack);
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
privateKeyFieldState: ${privateKeyFieldState},
isPrivateKeyValid: ${isPrivateKeyValid}
    ''';
  }
}
