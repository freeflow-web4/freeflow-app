// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_flower_name_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletFlowerNameController
    on _CreateWalletEmailControllerBase, Store {
  Computed<bool>? _$buttonNextActivatedComputed;

  @override
  bool get buttonNextActivated => (_$buttonNextActivatedComputed ??=
          Computed<bool>(() => super.buttonNextActivated,
              name: '_CreateWalletEmailControllerBase.buttonNextActivated'))
      .value;
  Computed<bool>? _$isGradientTextFieldValidComputed;

  @override
  bool get isGradientTextFieldValid => (_$isGradientTextFieldValidComputed ??=
          Computed<bool>(() => super.isGradientTextFieldValid,
              name:
                  '_CreateWalletEmailControllerBase.isGradientTextFieldValid'))
      .value;

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

  final _$currentFlowerNameAtom =
      Atom(name: '_CreateWalletEmailControllerBase.currentFlowerName');

  @override
  String get currentFlowerName {
    _$currentFlowerNameAtom.reportRead();
    return super.currentFlowerName;
  }

  @override
  set currentFlowerName(String value) {
    _$currentFlowerNameAtom.reportWrite(value, super.currentFlowerName, () {
      super.currentFlowerName = value;
    });
  }

  final _$_CreateWalletEmailControllerBaseActionController =
      ActionController(name: '_CreateWalletEmailControllerBase');

  @override
  void onFlowerNameChanged(String value) {
    final _$actionInfo =
        _$_CreateWalletEmailControllerBaseActionController.startAction(
            name: '_CreateWalletEmailControllerBase.onFlowerNameChanged');
    try {
      return super.onFlowerNameChanged(value);
    } finally {
      _$_CreateWalletEmailControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onNextButtonPressed(
      void Function(FlowerNameFormEntity) onValid, void Function() onInvalid) {
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
formValid: ${formValid},
currentFlowerName: ${currentFlowerName},
buttonNextActivated: ${buttonNextActivated},
isGradientTextFieldValid: ${isGradientTextFieldValid}
    ''';
  }
}
