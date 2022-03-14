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

  final _$pinFieldStateAtom = Atom(name: 'AuthControllerBase.pinFieldState');

  @override
  PinFieldState get pinFieldState {
    _$pinFieldStateAtom.reportRead();
    return super.pinFieldState;
  }

  @override
  set pinFieldState(PinFieldState value) {
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

  final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase');

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
  String onKeyboardTap(String digit, String currentPinFieldText) {
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
  void updatePinFieldState(PinFieldState state) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updatePinFieldState');
    try {
      return super.updatePinFieldState(state);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pinFieldState: ${pinFieldState},
isPinObscure: ${isPinObscure},
isPinValid: ${isPinValid}
    ''';
  }
}
