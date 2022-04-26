// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_private_key_show_state_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletPrivateKeyShowStateController
    on _CreateWalletEmailControllerBase, Store {
  final _$gradientTextFieldStateAtom =
      Atom(name: '_CreateWalletEmailControllerBase.gradientTextFieldState');

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

  final _$buttonNextActivatedAtom =
      Atom(name: '_CreateWalletEmailControllerBase.buttonNextActivated');

  @override
  bool get buttonNextActivated {
    _$buttonNextActivatedAtom.reportRead();
    return super.buttonNextActivated;
  }

  @override
  set buttonNextActivated(bool value) {
    _$buttonNextActivatedAtom.reportWrite(value, super.buttonNextActivated, () {
      super.buttonNextActivated = value;
    });
  }

  final _$_CreateWalletEmailControllerBaseActionController =
      ActionController(name: '_CreateWalletEmailControllerBase');

  @override
  void setButtonEnabled() {
    final _$actionInfo = _$_CreateWalletEmailControllerBaseActionController
        .startAction(name: '_CreateWalletEmailControllerBase.setButtonEnabled');
    try {
      return super.setButtonEnabled();
    } finally {
      _$_CreateWalletEmailControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed(void Function() onValid, void Function() onInvalid) {
    final _$actionInfo =
        _$_CreateWalletEmailControllerBaseActionController.startAction(
            name: '_CreateWalletEmailControllerBase.onNextButtonPressed');
    try {
      return super.onNextButtonPressed(onValid, onInvalid);
    } finally {
      _$_CreateWalletEmailControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gradientTextFieldState: ${gradientTextFieldState},
buttonNextActivated: ${buttonNextActivated}
    ''';
  }
}
