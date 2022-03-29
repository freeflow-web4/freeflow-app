// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_confirm_pin_code_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverConfirmPinCodeViewController
    on RecoverConfirmPinCodeViewControllerBase, Store {
  Computed<bool>? _$isConfirmPinCodeValidComputed;

  @override
  bool get isConfirmPinCodeValid => (_$isConfirmPinCodeValidComputed ??= Computed<
              bool>(() => super.isConfirmPinCodeValid,
          name:
              'RecoverConfirmPinCodeViewControllerBase.isConfirmPinCodeValid'))
      .value;

  final _$isObscuredPinAtom =
      Atom(name: 'RecoverConfirmPinCodeViewControllerBase.isObscuredPin');

  @override
  bool get isObscuredPin {
    _$isObscuredPinAtom.reportRead();
    return super.isObscuredPin;
  }

  @override
  set isObscuredPin(bool value) {
    _$isObscuredPinAtom.reportWrite(value, super.isObscuredPin, () {
      super.isObscuredPin = value;
    });
  }

  final _$rememberMeAtom =
      Atom(name: 'RecoverConfirmPinCodeViewControllerBase.rememberMe');

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

  final _$currentConfirmPinCodeAtom = Atom(
      name: 'RecoverConfirmPinCodeViewControllerBase.currentConfirmPinCode');

  @override
  String get currentConfirmPinCode {
    _$currentConfirmPinCodeAtom.reportRead();
    return super.currentConfirmPinCode;
  }

  @override
  set currentConfirmPinCode(String value) {
    _$currentConfirmPinCodeAtom.reportWrite(value, super.currentConfirmPinCode,
        () {
      super.currentConfirmPinCode = value;
    });
  }

  final _$hasAvailableBiometricsAtom = Atom(
      name: 'RecoverConfirmPinCodeViewControllerBase.hasAvailableBiometrics');

  @override
  bool get hasAvailableBiometrics {
    _$hasAvailableBiometricsAtom.reportRead();
    return super.hasAvailableBiometrics;
  }

  @override
  set hasAvailableBiometrics(bool value) {
    _$hasAvailableBiometricsAtom
        .reportWrite(value, super.hasAvailableBiometrics, () {
      super.hasAvailableBiometrics = value;
    });
  }

  final _$isBiometricAvailableAtom = Atom(
      name: 'RecoverConfirmPinCodeViewControllerBase.isBiometricAvailable');

  @override
  bool get isBiometricAvailable {
    _$isBiometricAvailableAtom.reportRead();
    return super.isBiometricAvailable;
  }

  @override
  set isBiometricAvailable(bool value) {
    _$isBiometricAvailableAtom.reportWrite(value, super.isBiometricAvailable,
        () {
      super.isBiometricAvailable = value;
    });
  }

  final _$confirmPinCodeFieldStateAtom = Atom(
      name: 'RecoverConfirmPinCodeViewControllerBase.confirmPinCodeFieldState');

  @override
  ConfirmPinCodeFieldState get confirmPinCodeFieldState {
    _$confirmPinCodeFieldStateAtom.reportRead();
    return super.confirmPinCodeFieldState;
  }

  @override
  set confirmPinCodeFieldState(ConfirmPinCodeFieldState value) {
    _$confirmPinCodeFieldStateAtom
        .reportWrite(value, super.confirmPinCodeFieldState, () {
      super.confirmPinCodeFieldState = value;
    });
  }

  final _$onPinCodeChangedAsyncAction =
      AsyncAction('RecoverConfirmPinCodeViewControllerBase.onPinCodeChanged');

  @override
  Future<void> onPinCodeChanged(String value, String pinCode) {
    return _$onPinCodeChangedAsyncAction
        .run(() => super.onPinCodeChanged(value, pinCode));
  }

  final _$validatePinCodeAsyncAction =
      AsyncAction('RecoverConfirmPinCodeViewControllerBase.validatePinCode');

  @override
  Future<void> validatePinCode(String value, String pinCode) {
    return _$validatePinCodeAsyncAction
        .run(() => super.validatePinCode(value, pinCode));
  }

  final _$RecoverConfirmPinCodeViewControllerBaseActionController =
      ActionController(name: 'RecoverConfirmPinCodeViewControllerBase');

  @override
  void onValidatePinCodeSuccess(String value) {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name:
                'RecoverConfirmPinCodeViewControllerBase.onValidatePinCodeSuccess');
    try {
      return super.onValidatePinCodeSuccess(value);
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onValidatePinCodeFailure() {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name:
                'RecoverConfirmPinCodeViewControllerBase.onValidatePinCodeFailure');
    try {
      return super.onValidatePinCodeFailure();
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onValidatePinCodeEmpty() {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name:
                'RecoverConfirmPinCodeViewControllerBase.onValidatePinCodeEmpty');
    try {
      return super.onValidatePinCodeEmpty();
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateConfirmPinCodeFieldState(ConfirmPinCodeFieldState state) {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name:
                'RecoverConfirmPinCodeViewControllerBase.updateConfirmPinCodeFieldState');
    try {
      return super.updateConfirmPinCodeFieldState(state);
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setObscuredPin() {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name: 'RecoverConfirmPinCodeViewControllerBase.setObscuredPin');
    try {
      return super.setObscuredPin();
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void getTypePinCode(BuildContext context, String value, String pinCode) {
    final _$actionInfo =
        _$RecoverConfirmPinCodeViewControllerBaseActionController.startAction(
            name: 'RecoverConfirmPinCodeViewControllerBase.getTypePinCode');
    try {
      return super.getTypePinCode(context, value, pinCode);
    } finally {
      _$RecoverConfirmPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscuredPin: ${isObscuredPin},
rememberMe: ${rememberMe},
currentConfirmPinCode: ${currentConfirmPinCode},
hasAvailableBiometrics: ${hasAvailableBiometrics},
isBiometricAvailable: ${isBiometricAvailable},
confirmPinCodeFieldState: ${confirmPinCodeFieldState},
isConfirmPinCodeValid: ${isConfirmPinCodeValid}
    ''';
  }
}
