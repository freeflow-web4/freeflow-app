// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_name_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletNameController on _CreateWalletControllerBase, Store {
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

  final _$nameFieldStateAtom =
      Atom(name: '_CreateWalletControllerBase.nameFieldState');

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

  final _$formValidAtom = Atom(name: '_CreateWalletControllerBase.formValid');

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

  final _$currentNameAtom =
      Atom(name: '_CreateWalletControllerBase.currentName');

  @override
  String get currentName {
    _$currentNameAtom.reportRead();
    return super.currentName;
  }

  @override
  set currentName(String value) {
    _$currentNameAtom.reportWrite(value, super.currentName, () {
      super.currentName = value;
    });
  }

  final _$onNameChangedAsyncAction =
      AsyncAction('_CreateWalletControllerBase.onNameChanged');

  @override
  Future<void> onNameChanged({required String value}) {
    return _$onNameChangedAsyncAction
        .run(() => super.onNameChanged(value: value));
  }

  final _$_CreateWalletControllerBaseActionController =
      ActionController(name: '_CreateWalletControllerBase');

  @override
  void onNextButtonPressed(
      void Function(NameFormEntity) onValid, void Function() onInvalid) {
    final _$actionInfo = _$_CreateWalletControllerBaseActionController
        .startAction(name: '_CreateWalletControllerBase.onNextButtonPressed');
    try {
      return super.onNextButtonPressed(onValid, onInvalid);
    } finally {
      _$_CreateWalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameFieldState: ${nameFieldState},
formValid: ${formValid},
currentName: ${currentName},
buttonNextActivated: ${buttonNextActivated},
isGradientTextFieldValid: ${isGradientTextFieldValid}
    ''';
  }
}
