// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_keyboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InAppKeyboardController on InAppKeyboardControllerBase, Store {
  final _$textAtom = Atom(name: 'InAppKeyboardControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$InAppKeyboardControllerBaseActionController =
      ActionController(name: 'InAppKeyboardControllerBase');

  @override
  void setText(String key) {
    final _$actionInfo = _$InAppKeyboardControllerBaseActionController
        .startAction(name: 'InAppKeyboardControllerBase.setText');
    try {
      return super.setText(key);
    } finally {
      _$InAppKeyboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delKey() {
    final _$actionInfo = _$InAppKeyboardControllerBaseActionController
        .startAction(name: 'InAppKeyboardControllerBase.delKey');
    try {
      return super.delKey();
    } finally {
      _$InAppKeyboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearText() {
    final _$actionInfo = _$InAppKeyboardControllerBaseActionController
        .startAction(name: 'InAppKeyboardControllerBase.clearText');
    try {
      return super.clearText();
    } finally {
      _$InAppKeyboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text}
    ''';
  }
}
