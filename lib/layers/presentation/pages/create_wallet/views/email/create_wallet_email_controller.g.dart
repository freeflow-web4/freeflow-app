// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_email_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletEmailController on _CreateWalletEmailControllerBase, Store {
  Computed<bool>? _$buttonNextActivatedComputed;

  @override
  bool get buttonNextActivated => (_$buttonNextActivatedComputed ??=
          Computed<bool>(() => super.buttonNextActivated,
              name: '_CreateWalletEmailControllerBase.buttonNextActivated'))
      .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_CreateWalletEmailControllerBase.isEmailValid'))
          .value;

  final _$privateKeyFieldStateAtom =
      Atom(name: '_CreateWalletEmailControllerBase.privateKeyFieldState');

  @override
  GradientTextFieldState get privateKeyFieldState {
    _$privateKeyFieldStateAtom.reportRead();
    return super.privateKeyFieldState;
  }

  @override
  set privateKeyFieldState(GradientTextFieldState value) {
    _$privateKeyFieldStateAtom.reportWrite(value, super.privateKeyFieldState,
        () {
      super.privateKeyFieldState = value;
    });
  }

  final _$formValidAtom =
      Atom(name: '_CreateWalletEmailControllerBase.formValid');

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

  final _$currentEmailAtom =
      Atom(name: '_CreateWalletEmailControllerBase.currentEmail');

  @override
  String get currentEmail {
    _$currentEmailAtom.reportRead();
    return super.currentEmail;
  }

  @override
  set currentEmail(String value) {
    _$currentEmailAtom.reportWrite(value, super.currentEmail, () {
      super.currentEmail = value;
    });
  }

  final _$_CreateWalletEmailControllerBaseActionController =
      ActionController(name: '_CreateWalletEmailControllerBase');

  @override
  void onEmailChanged(String value) {
    final _$actionInfo = _$_CreateWalletEmailControllerBaseActionController
        .startAction(name: '_CreateWalletEmailControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(value);
    } finally {
      _$_CreateWalletEmailControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed(
      void Function(EmailFormEntity) onValid, void Function() onInvalid) {
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
privateKeyFieldState: ${privateKeyFieldState},
formValid: ${formValid},
currentEmail: ${currentEmail},
buttonNextActivated: ${buttonNextActivated},
isEmailValid: ${isEmailValid}
    ''';
  }
}
