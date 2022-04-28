// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogoutAuthController on _LogoutAuthControllerBase, Store {
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_LogoutAuthControllerBase.formValid'))
          .value;

  final _$pinFieldStateAtom =
      Atom(name: '_LogoutAuthControllerBase.pinFieldState');

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

  final _$currentPinAtom = Atom(name: '_LogoutAuthControllerBase.currentPin');

  @override
  String get currentPin {
    _$currentPinAtom.reportRead();
    return super.currentPin;
  }

  @override
  set currentPin(String value) {
    _$currentPinAtom.reportWrite(value, super.currentPin, () {
      super.currentPin = value;
    });
  }

  final _$isPinObscureAtom =
      Atom(name: '_LogoutAuthControllerBase.isPinObscure');

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

  final _$_LogoutAuthControllerBaseActionController =
      ActionController(name: '_LogoutAuthControllerBase');

  @override
  void onPinChanged(String pin) {
    final _$actionInfo = _$_LogoutAuthControllerBaseActionController
        .startAction(name: '_LogoutAuthControllerBase.onPinChanged');
    try {
      return super.onPinChanged(pin);
    } finally {
      _$_LogoutAuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinObscureTextFieldTap() {
    final _$actionInfo =
        _$_LogoutAuthControllerBaseActionController.startAction(
            name: '_LogoutAuthControllerBase.onPinObscureTextFieldTap');
    try {
      return super.onPinObscureTextFieldTap();
    } finally {
      _$_LogoutAuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed() {
    final _$actionInfo = _$_LogoutAuthControllerBaseActionController
        .startAction(name: '_LogoutAuthControllerBase.onNextButtonPressed');
    try {
      return super.onNextButtonPressed();
    } finally {
      _$_LogoutAuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinValid() {
    final _$actionInfo = _$_LogoutAuthControllerBaseActionController
        .startAction(name: '_LogoutAuthControllerBase.onPinValid');
    try {
      return super.onPinValid();
    } finally {
      _$_LogoutAuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinInValid() {
    final _$actionInfo = _$_LogoutAuthControllerBaseActionController
        .startAction(name: '_LogoutAuthControllerBase.onPinInValid');
    try {
      return super.onPinInValid();
    } finally {
      _$_LogoutAuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pinFieldState: ${pinFieldState},
currentPin: ${currentPin},
isPinObscure: ${isPinObscure},
formValid: ${formValid}
    ''';
  }
}
