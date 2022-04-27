// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_confirm_pin_code_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletConfirmPinCodeController
    on _CreateWalletConfirmPinCodeControllerBase, Store {
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_CreateWalletConfirmPinCodeControllerBase.formValid'))
          .value;
  Computed<bool>? _$isGradientTextFieldValidComputed;

  @override
  bool get isGradientTextFieldValid => (_$isGradientTextFieldValidComputed ??=
          Computed<bool>(() => super.isGradientTextFieldValid,
              name:
                  '_CreateWalletConfirmPinCodeControllerBase.isGradientTextFieldValid'))
      .value;

  final _$pinFieldStateAtom =
      Atom(name: '_CreateWalletConfirmPinCodeControllerBase.pinFieldState');

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

  final _$isPinObscureAtom =
      Atom(name: '_CreateWalletConfirmPinCodeControllerBase.isPinObscure');

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

  final _$rememberMeAtom =
      Atom(name: '_CreateWalletConfirmPinCodeControllerBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$currentPinCodeAtom =
      Atom(name: '_CreateWalletConfirmPinCodeControllerBase.currentPinCode');

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

  final _$_CreateWalletConfirmPinCodeControllerBaseActionController =
      ActionController(name: '_CreateWalletConfirmPinCodeControllerBase');

  @override
  void onPinObscureTextFieldTap() {
    final _$actionInfo =
        _$_CreateWalletConfirmPinCodeControllerBaseActionController.startAction(
            name:
                '_CreateWalletConfirmPinCodeControllerBase.onPinObscureTextFieldTap');
    try {
      return super.onPinObscureTextFieldTap();
    } finally {
      _$_CreateWalletConfirmPinCodeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onPinChanged(String value) {
    final _$actionInfo =
        _$_CreateWalletConfirmPinCodeControllerBaseActionController.startAction(
            name: '_CreateWalletConfirmPinCodeControllerBase.onPinChanged');
    try {
      return super.onPinChanged(value);
    } finally {
      _$_CreateWalletConfirmPinCodeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void _updateCurrentPinCode(String value) {
    final _$actionInfo =
        _$_CreateWalletConfirmPinCodeControllerBaseActionController.startAction(
            name:
                '_CreateWalletConfirmPinCodeControllerBase._updateCurrentPinCode');
    try {
      return super._updateCurrentPinCode(value);
    } finally {
      _$_CreateWalletConfirmPinCodeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed(void Function() onValid, void Function() onInvalid) {
    final _$actionInfo =
        _$_CreateWalletConfirmPinCodeControllerBaseActionController.startAction(
            name:
                '_CreateWalletConfirmPinCodeControllerBase.onNextButtonPressed');
    try {
      return super.onNextButtonPressed(onValid, onInvalid);
    } finally {
      _$_CreateWalletConfirmPinCodeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRememberMe(bool value) {
    final _$actionInfo =
        _$_CreateWalletConfirmPinCodeControllerBaseActionController.startAction(
            name: '_CreateWalletConfirmPinCodeControllerBase.setRememberMe');
    try {
      return super.setRememberMe(value);
    } finally {
      _$_CreateWalletConfirmPinCodeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pinFieldState: ${pinFieldState},
isPinObscure: ${isPinObscure},
rememberMe: ${rememberMe},
currentPinCode: ${currentPinCode},
formValid: ${formValid},
isGradientTextFieldValid: ${isGradientTextFieldValid}
    ''';
  }
}
