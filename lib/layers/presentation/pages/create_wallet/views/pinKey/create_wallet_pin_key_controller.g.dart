// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_pin_key_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletPinKeyController
    on _CreateWalletPinKeyControllerBase, Store {
  Computed<bool>? _$buttonNextActivatedComputed;

  @override
  bool get buttonNextActivated => (_$buttonNextActivatedComputed ??=
          Computed<bool>(() => super.buttonNextActivated,
              name: '_CreateWalletPinKeyControllerBase.buttonNextActivated'))
      .value;
  Computed<bool>? _$isGradientTextFieldValidComputed;

  @override
  bool get isGradientTextFieldValid => (_$isGradientTextFieldValidComputed ??=
          Computed<bool>(() => super.isGradientTextFieldValid,
              name:
                  '_CreateWalletPinKeyControllerBase.isGradientTextFieldValid'))
      .value;

  final _$nameFieldStateAtom =
      Atom(name: '_CreateWalletPinKeyControllerBase.nameFieldState');

  @override
  GradientTextFieldState get nameFieldState {
    _$nameFieldStateAtom.reportRead();
    return super.nameFieldState;
  }

  @override
  set nameFieldState(GradientTextFieldState value) {
    _$nameFieldStateAtom.reportWrite(value, super.nameFieldState, () {
      super.nameFieldState = value;
    });
  }

  final _$formValidAtom =
      Atom(name: '_CreateWalletPinKeyControllerBase.formValid');

  @override
  bool get formValid {
    _$formValidAtom.reportRead();
    return super.formValid;
  }

  @override
  set formValid(bool value) {
    _$formValidAtom.reportWrite(value, super.formValid, () {
      super.formValid = value;
    });
  }

  final _$isPinObscureAtom =
      Atom(name: '_CreateWalletPinKeyControllerBase.isPinObscure');

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

  final _$_CreateWalletPinKeyControllerBaseActionController =
      ActionController(name: '_CreateWalletPinKeyControllerBase');

  @override
  void onNameChanged(String value) {
    final _$actionInfo = _$_CreateWalletPinKeyControllerBaseActionController
        .startAction(name: '_CreateWalletPinKeyControllerBase.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_CreateWalletPinKeyControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed(void Function() onValid, void Function() onInvalid) {
    final _$actionInfo =
        _$_CreateWalletPinKeyControllerBaseActionController.startAction(
            name: '_CreateWalletPinKeyControllerBase.onNextButtonPressed');
    try {
      return super.onNextButtonPressed(onValid, onInvalid);
    } finally {
      _$_CreateWalletPinKeyControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameFieldState: ${nameFieldState},
formValid: ${formValid},
isPinObscure: ${isPinObscure},
buttonNextActivated: ${buttonNextActivated},
isGradientTextFieldValid: ${isGradientTextFieldValid}
    ''';
  }
}
