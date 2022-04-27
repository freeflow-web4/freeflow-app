// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remember_me_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RememberMeController on _RememberMeControllerBase, Store {
  final _$hasBiometricAtom =
      Atom(name: '_RememberMeControllerBase.hasBiometric');

  @override
  bool? get biometricIsEnable {
    _$hasBiometricAtom.reportRead();
    return super.biometricIsEnable;
  }

  @override
  set biometricIsEnable(bool? value) {
    _$hasBiometricAtom.reportWrite(value, super.biometricIsEnable, () {
      super.biometricIsEnable = value;
    });
  }

  final _$getIfHasBiometricAsyncAction =
      AsyncAction('_RememberMeControllerBase.getIfHasBiometric');

  @override
  Future<void> getIfBiometricIsEnable() {
    return _$getIfHasBiometricAsyncAction.run(() => super.getIfBiometricIsEnable());
  }

  final _$setBiometricAsyncAction =
      AsyncAction('_RememberMeControllerBase.setBiometric');

  @override
  Future<bool> setBiometricStatus(bool status) {
    return _$setBiometricAsyncAction.run(() => super.setBiometricStatus(status));
  }

  @override
  String toString() {
    return '''
hasBiometric: ${biometricIsEnable}
    ''';
  }
}
