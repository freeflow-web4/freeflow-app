// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_username_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverUsernameController on RecoverUsernameControllerBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: 'RecoverUsernameControllerBase.isNameValid'))
          .value;

  final _$currentUsernameAtom =
      Atom(name: 'RecoverUsernameControllerBase.currentUsername');

  @override
  String get currentUsername {
    _$currentUsernameAtom.reportRead();
    return super.currentUsername;
  }

  @override
  set currentUsername(String value) {
    _$currentUsernameAtom.reportWrite(value, super.currentUsername, () {
      super.currentUsername = value;
    });
  }

  final _$usernameFieldStateAtom =
      Atom(name: 'RecoverUsernameControllerBase.usernameFieldState');

  @override
  UsernameFieldState get usernameFieldState {
    _$usernameFieldStateAtom.reportRead();
    return super.usernameFieldState;
  }

  @override
  set usernameFieldState(UsernameFieldState value) {
    _$usernameFieldStateAtom.reportWrite(value, super.usernameFieldState, () {
      super.usernameFieldState = value;
    });
  }

  final _$isValidatingAtom =
      Atom(name: 'RecoverUsernameControllerBase.isValidating');

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

  final _$onUsernameChangedAsyncAction =
      AsyncAction('RecoverUsernameControllerBase.onUsernameChanged');

  @override
  Future<void> onUsernameChanged(
      String value, Function errorCallBack, Function loadingCallBack) {
    return _$onUsernameChangedAsyncAction.run(
        () => super.onUsernameChanged(value, errorCallBack, loadingCallBack));
  }

  final _$validateUsernameAsyncAction =
      AsyncAction('RecoverUsernameControllerBase.validateUsername');

  @override
  Future<void> validateUsername(
      String value, Function errorCallBack, Function loadingCallBack) {
    return _$validateUsernameAsyncAction.run(
        () => super.validateUsername(value, errorCallBack, loadingCallBack));
  }

  final _$RecoverUsernameControllerBaseActionController =
      ActionController(name: 'RecoverUsernameControllerBase');

  @override
  void onValidateUsernameSuccess(String value) {
    final _$actionInfo =
        _$RecoverUsernameControllerBaseActionController.startAction(
            name: 'RecoverUsernameControllerBase.onValidateUsernameSuccess');
    try {
      return super.onValidateUsernameSuccess(value);
    } finally {
      _$RecoverUsernameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onValidateUsernameFailure(DomainError error, Function errorCallBack) {
    final _$actionInfo =
        _$RecoverUsernameControllerBaseActionController.startAction(
            name: 'RecoverUsernameControllerBase.onValidateUsernameFailure');
    try {
      return super.onValidateUsernameFailure(error, errorCallBack);
    } finally {
      _$RecoverUsernameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUsernameFieldState(UsernameFieldState state) {
    final _$actionInfo =
        _$RecoverUsernameControllerBaseActionController.startAction(
            name: 'RecoverUsernameControllerBase.updateUsernameFieldState');
    try {
      return super.updateUsernameFieldState(state);
    } finally {
      _$RecoverUsernameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUsername: ${currentUsername},
usernameFieldState: ${usernameFieldState},
isValidating: ${isValidating},
isNameValid: ${isNameValid}
    ''';
  }
}
