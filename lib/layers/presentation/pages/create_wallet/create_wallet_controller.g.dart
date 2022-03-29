// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletController on _CreateWalletControllerBase, Store {
  Computed<bool>? _$buttonNextActivatedComputed;

  @override
  bool get buttonNextActivated => (_$buttonNextActivatedComputed ??=
          Computed<bool>(() => super.buttonNextActivated,
              name: '_CreateWalletControllerBase.buttonNextActivated'))
      .value;
  Computed<bool>? _$isGradientTextFieldValidComputed;

  @override
  bool get isGradientTextFieldValid => (_$isGradientTextFieldValidComputed ??=
          Computed<bool>(() => super.isGradientTextFieldValid,
              name: '_CreateWalletControllerBase.isGradientTextFieldValid'))
      .value;

  final _$gradientTextFieldStateAtom =
      Atom(name: '_CreateWalletControllerBase.gradientTextFieldState');

  @override
  GradientTextFieldState get gradientTextFieldState {
    _$gradientTextFieldStateAtom.reportRead();
    return super.gradientTextFieldState;
  }

  @override
  set gradientTextFieldState(GradientTextFieldState value) {
    _$gradientTextFieldStateAtom
        .reportWrite(value, super.gradientTextFieldState, () {
      super.gradientTextFieldState = value;
    });
  }

  final _$_CreateWalletControllerBaseActionController =
      ActionController(name: '_CreateWalletControllerBase');

  @override
  void onEmailChanged(String value) {
    final _$actionInfo = _$_CreateWalletControllerBaseActionController
        .startAction(name: '_CreateWalletControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(value);
    } finally {
      _$_CreateWalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gradientTextFieldState: ${gradientTextFieldState},
buttonNextActivated: ${buttonNextActivated},
isGradientTextFieldValid: ${isGradientTextFieldValid}
    ''';
  }
}
