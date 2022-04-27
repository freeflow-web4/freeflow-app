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
  bool? get hasBiometric {
    _$hasBiometricAtom.reportRead();
    return super.hasBiometric;
  }

  @override
  set hasBiometric(bool? value) {
    _$hasBiometricAtom.reportWrite(value, super.hasBiometric, () {
      super.hasBiometric = value;
    });
  }

  final _$getIfHasBiometricAsyncAction =
      AsyncAction('_RememberMeControllerBase.getIfHasBiometric');

  @override
  Future<void> getIfHasBiometric() {
    return _$getIfHasBiometricAsyncAction.run(() => super.getIfHasBiometric());
  }

  @override
  String toString() {
    return '''
hasBiometric: ${hasBiometric}
    ''';
  }
}
