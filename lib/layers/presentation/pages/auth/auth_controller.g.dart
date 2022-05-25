// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isPinValidComputed;

  @override
  bool get isPinValid =>
      (_$isPinValidComputed ??= Computed<bool>(() => super.isPinValid,
              name: 'AuthControllerBase.isPinValid'))
          .value;
  Computed<bool>? _$pinCodeChangeIsCompleteComputed;

  @override
  bool get pinCodeChangeIsComplete => (_$pinCodeChangeIsCompleteComputed ??=
          Computed<bool>(() => super.pinCodeChangeIsComplete,
              name: 'AuthControllerBase.pinCodeChangeIsComplete'))
      .value;
  Computed<bool>? _$hasErrorInPincodeChangeComputed;

  @override
  bool get hasErrorInPincodeChange => (_$hasErrorInPincodeChangeComputed ??=
          Computed<bool>(() => super.hasErrorInPincodeChange,
              name: 'AuthControllerBase.hasErrorInPincodeChange'))
      .value;
  Computed<bool>? _$pinCodeIsInvalidComputed;

  @override
  bool get pinCodeIsInvalid => (_$pinCodeIsInvalidComputed ??= Computed<bool>(
          () => super.pinCodeIsInvalid,
          name: 'AuthControllerBase.pinCodeIsInvalid'))
      .value;
  Computed<bool>? _$hasErrorInPinFieldComputed;

  @override
  bool get hasErrorInPinField => (_$hasErrorInPinFieldComputed ??=
          Computed<bool>(() => super.hasErrorInPinField,
              name: 'AuthControllerBase.hasErrorInPinField'))
      .value;
  Computed<bool>? _$isInsertingNewPincodeComputed;

  @override
  bool get isInsertingNewPincode => (_$isInsertingNewPincodeComputed ??=
          Computed<bool>(() => super.isInsertingNewPincode,
              name: 'AuthControllerBase.isInsertingNewPincode'))
      .value;
  Computed<bool>? _$isConfirmingNewPincodeComputed;

  @override
  bool get isConfirmingNewPincode => (_$isConfirmingNewPincodeComputed ??=
          Computed<bool>(() => super.isConfirmingNewPincode,
              name: 'AuthControllerBase.isConfirmingNewPincode'))
      .value;

  final _$currentPinCodeAtom = Atom(name: 'AuthControllerBase.currentPinCode');

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

  final _$authenticationPinAtom =
      Atom(name: 'AuthControllerBase.authenticationPin');

  @override
  String get authenticationPin {
    _$authenticationPinAtom.reportRead();
    return super.authenticationPin;
  }

  @override
  set authenticationPin(String value) {
    _$authenticationPinAtom.reportWrite(value, super.authenticationPin, () {
      super.authenticationPin = value;
    });
  }

  final _$pinFieldStateAtom = Atom(name: 'AuthControllerBase.pinFieldState');

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

  final _$isPinObscureAtom = Atom(name: 'AuthControllerBase.isPinObscure');

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

  final _$isPinCorrectAtom = Atom(name: 'AuthControllerBase.isPinCorrect');

  @override
  bool get isPinCorrect {
    _$isPinCorrectAtom.reportRead();
    return super.isPinCorrect;
  }

  @override
  set isPinCorrect(bool value) {
    _$isPinCorrectAtom.reportWrite(value, super.isPinCorrect, () {
      super.isPinCorrect = value;
    });
  }

  final _$recoverPincodeStateAtom =
      Atom(name: 'AuthControllerBase.recoverPincodeState');

  @override
  RecoverPincodeState? get recoverPincodeState {
    _$recoverPincodeStateAtom.reportRead();
    return super.recoverPincodeState;
  }

  @override
  set recoverPincodeState(RecoverPincodeState? value) {
    _$recoverPincodeStateAtom.reportWrite(value, super.recoverPincodeState, () {
      super.recoverPincodeState = value;
    });
  }

  final _$pinCodeHasMatchAsyncAction =
      AsyncAction('AuthControllerBase.pinCodeHasMatch');

  @override
  Future<void> pinCodeHasMatch() {
    return _$pinCodeHasMatchAsyncAction.run(() => super.pinCodeHasMatch());
  }

  final _$setNewPincodeAsyncAction =
      AsyncAction('AuthControllerBase.setNewPincode');

  @override
  Future<void> setNewPincode(String newAuthenticationPinCode) {
    return _$setNewPincodeAsyncAction
        .run(() => super.setNewPincode(newAuthenticationPinCode));
  }

  final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase');

  @override
  void updateCurrentPinCode(String value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updateCurrentPinCode');
    try {
      return super.updateCurrentPinCode(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinChanged(String value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onPinChanged');
    try {
      return super.onPinChanged(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onKeyboardTap(String digit, String currentPinFieldText) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onKeyboardTap');
    try {
      return super.onKeyboardTap(digit, currentPinFieldText);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePincode() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.validatePincode');
    try {
      return super.validatePincode();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPinObscureTextFieldTap() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.onPinObscureTextFieldTap');
    try {
      return super.onPinObscureTextFieldTap();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePinFieldState(GradientTextFieldState state) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updatePinFieldState');
    try {
      return super.updatePinFieldState(state);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPinData() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.clearPinData');
    try {
      return super.clearPinData();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateChangePincodeSteps({Function? onFail, Function? onSuccess}) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updateChangePincodeSteps');
    try {
      return super
          .updateChangePincodeSteps(onFail: onFail, onSuccess: onSuccess);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPinCode: ${currentPinCode},
authenticationPin: ${authenticationPin},
pinFieldState: ${pinFieldState},
isPinObscure: ${isPinObscure},
isPinCorrect: ${isPinCorrect},
recoverPincodeState: ${recoverPincodeState},
isPinValid: ${isPinValid},
pinCodeChangeIsComplete: ${pinCodeChangeIsComplete},
hasErrorInPincodeChange: ${hasErrorInPincodeChange},
pinCodeIsInvalid: ${pinCodeIsInvalid},
hasErrorInPinField: ${hasErrorInPinField},
isInsertingNewPincode: ${isInsertingNewPincode},
isConfirmingNewPincode: ${isConfirmingNewPincode}
    ''';
  }
}
