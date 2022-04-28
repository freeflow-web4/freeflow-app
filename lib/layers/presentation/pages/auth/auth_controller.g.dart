// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isPinValidComputed;

  @override
  bool get isPinValid =>
      (_$isPinValidComputed ??= Computed<bool>(() => super.isPinValid,
              name: 'AuthControllerBase.isPinValid'))
          .value;

  final _$currentPinCodeAtom = Atom(name: 'AuthControllerBase.currentPinCode');

  @override
  String get currentPinCode {
    _$currentPinCodeAtom.reportRead();
    return super.currentPinCode;
  }

  @override
  set currentPinCode(String value) {
    _$currentPinCodeAtom.reportWrite(value, super.currentPinCode, () {
      super.currentPinCode = value;
    });
  }

  final _$pinFieldStateAtom = Atom(name: 'AuthControllerBase.pinFieldState');

  @override
  GradientTextFieldState get pinFieldState {
    _$pinFieldStateAtom.reportRead();
    return super.pinFieldState;
  }

  @override
  set pinFieldState(GradientTextFieldState value) {
    _$pinFieldStateAtom.reportWrite(value, super.pinFieldState, () {
      super.pinFieldState = value;
    });
  }

  final _$isPinObscureAtom = Atom(name: 'AuthControllerBase.isPinObscure');

  @override
  bool get isPinObscure {
    _$isPinObscureAtom.reportRead();
    return super.isPinObscure;
  }

  @override
  set isPinObscure(bool value) {
    _$isPinObscureAtom.reportWrite(value, super.isPinObscure, () {
      super.isPinObscure = value;
    });
  }

  final _$updatePincodeStateAtom =
      Atom(name: 'AuthControllerBase.updatePincodeState');

  @override
  UpdatePincodeState get updatePincodeState {
    _$updatePincodeStateAtom.reportRead();
    return super.updatePincodeState;
  }

  @override
  set updatePincodeState(UpdatePincodeState value) {
    _$updatePincodeStateAtom.reportWrite(value, super.updatePincodeState, () {
      super.updatePincodeState = value;
    });
  }

  final _$pinCodeHasMatchAsyncAction =
      AsyncAction('AuthControllerBase.pinCodeHasMatch');

  @override
  Future pinCodeHasMatch() {
    return _$pinCodeHasMatchAsyncAction.run(() => super.pinCodeHasMatch());
  }

  final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase');

  @override
  void updateCurrentPinCode(String value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updateCurrentPinCode');
    try {
      return super.updateCurrentPinCode(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinChanged(String value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onPinChanged');
    try {
      return super.onPinChanged(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onKeyboardTap(String digit, String currentPinFieldText) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onKeyboardTap');
    try {
      return super.onKeyboardTap(digit, currentPinFieldText);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinObscureTextFieldTap() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onPinObscureTextFieldTap');
    try {
      return super.onPinObscureTextFieldTap();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePinFieldState(GradientTextFieldState state) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updatePinFieldState');
    try {
      return super.updatePinFieldState(state);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetPin() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.resetPin');
    try {
      return super.resetPin();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPincode(String newPincodeAuth) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setNewPincode');
    try {
      return super.setNewPincode(newPincodeAuth);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPinCode: ${currentPinCode},
pinFieldState: ${pinFieldState},
isPinObscure: ${isPinObscure},
updatePincodeState: ${updatePincodeState},
isPinValid: ${isPinValid}
    ''';
  }
}
