// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_pin_code_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverPinCodeViewController
    on RecoverPinCodeViewControllerBase, Store {
  final _$isPinValidAtom =
      Atom(name: 'RecoverPinCodeViewControllerBase.isPinValid');

  @override
  bool get isPinValid {
    _$isPinValidAtom.reportRead();
    return super.isPinValid;
  }

  @override
  set isPinValid(bool value) {
    _$isPinValidAtom.reportWrite(value, super.isPinValid, () {
      super.isPinValid = value;
    });
  }

  final _$isObscuredPinAtom =
      Atom(name: 'RecoverPinCodeViewControllerBase.isObscuredPin');

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
      Atom(name: 'RecoverPinCodeViewControllerBase.rememberMe');

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

  final _$pinCodeAtom = Atom(name: 'RecoverPinCodeViewControllerBase.pinCode');

  @override
  String get pinCode {
    _$pinCodeAtom.reportRead();
    return super.pinCode;
  }

  @override
  set pinCode(String value) {
    _$pinCodeAtom.reportWrite(value, super.pinCode, () {
      super.pinCode = value;
    });
  }

  final _$hasAvailableBiometricsAtom =
      Atom(name: 'RecoverPinCodeViewControllerBase.hasAvailableBiometrics');

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

  final _$confirmPinCodeAtom =
      Atom(name: 'RecoverPinCodeViewControllerBase.confirmPinCode');

  @override
  String get confirmPinCode {
    _$confirmPinCodeAtom.reportRead();
    return super.confirmPinCode;
  }

  @override
  set confirmPinCode(String value) {
    _$confirmPinCodeAtom.reportWrite(value, super.confirmPinCode, () {
      super.confirmPinCode = value;
    });
  }

  final _$setRememberMeAsyncAction =
      AsyncAction('RecoverPinCodeViewControllerBase.setRememberMe');

  @override
  Future<void> setRememberMe(bool value) {
    return _$setRememberMeAsyncAction.run(() => super.setRememberMe(value));
  }

  final _$biometricAuthAsyncAction =
      AsyncAction('RecoverPinCodeViewControllerBase.biometricAuth');

  @override
  Future<void> biometricAuth(bool value) {
    return _$biometricAuthAsyncAction.run(() => super.biometricAuth(value));
  }

  final _$canCheckBiometricsAsyncAction =
      AsyncAction('RecoverPinCodeViewControllerBase.canCheckBiometrics');

  @override
  Future<void> canCheckBiometrics() {
    return _$canCheckBiometricsAsyncAction
        .run(() => super.canCheckBiometrics());
  }

  final _$RecoverPinCodeViewControllerBaseActionController =
      ActionController(name: 'RecoverPinCodeViewControllerBase');

  @override
  void setObscuredPin() {
    final _$actionInfo = _$RecoverPinCodeViewControllerBaseActionController
        .startAction(name: 'RecoverPinCodeViewControllerBase.setObscuredPin');
    try {
      return super.setObscuredPin();
    } finally {
      _$RecoverPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void getTypePinCode(BuildContext context, String value,
      void Function(BuildContext, String) onChangedField) {
    final _$actionInfo = _$RecoverPinCodeViewControllerBaseActionController
        .startAction(name: 'RecoverPinCodeViewControllerBase.getTypePinCode');
    try {
      return super.getTypePinCode(context, value, onChangedField);
    } finally {
      _$RecoverPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void getTypeConfirmPinCode(BuildContext context, String value,
      void Function(BuildContext, String) onChangedField) {
    final _$actionInfo =
        _$RecoverPinCodeViewControllerBaseActionController.startAction(
            name: 'RecoverPinCodeViewControllerBase.getTypeConfirmPinCode');
    try {
      return super.getTypeConfirmPinCode(context, value, onChangedField);
    } finally {
      _$RecoverPinCodeViewControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPinValid: ${isPinValid},
isObscuredPin: ${isObscuredPin},
rememberMe: ${rememberMe},
pinCode: ${pinCode},
hasAvailableBiometrics: ${hasAvailableBiometrics},
confirmPinCode: ${confirmPinCode}
    ''';
  }
}
