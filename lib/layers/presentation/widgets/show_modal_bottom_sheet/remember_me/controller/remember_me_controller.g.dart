// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remember_me_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RememberMeController on _RememberMeControllerBase, Store {
  final _$biometricIsEnableAtom =
      Atom(name: '_RememberMeControllerBase.biometricIsEnable');

  @override
  bool? get biometricIsEnable {
    _$biometricIsEnableAtom.reportRead();
    return super.biometricIsEnable;
  }

  @override
  set biometricIsEnable(bool? value) {
    _$biometricIsEnableAtom.reportWrite(value, super.biometricIsEnable, () {
      super.biometricIsEnable = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RememberMeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getIfBiometricIsEnableAsyncAction =
      AsyncAction('_RememberMeControllerBase.getIfBiometricIsEnable');

  @override
  Future<void> getIfBiometricIsEnable() {
    return _$getIfBiometricIsEnableAsyncAction
        .run(() => super.getIfBiometricIsEnable());
  }

  final _$setBiometricStatusAsyncAction =
      AsyncAction('_RememberMeControllerBase.setBiometricStatus');

  @override
  Future<bool> setBiometricStatus(bool status) {
    return _$setBiometricStatusAsyncAction
        .run(() => super.setBiometricStatus(status));
  }

  @override
  String toString() {
    return '''
biometricIsEnable: ${biometricIsEnable},
loading: ${loading}
    ''';
  }
}
