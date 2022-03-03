// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverAccountController on RecoverAccountControllerBase, Store {
  final _$isContinueButtonActiveAtom =
      Atom(name: 'RecoverAccountControllerBase.isContinueButtonActive');

  @override
  bool get isContinueButtonActive {
    _$isContinueButtonActiveAtom.reportRead();
    return super.isContinueButtonActive;
  }

  @override
  set isContinueButtonActive(bool value) {
    _$isContinueButtonActiveAtom
        .reportWrite(value, super.isContinueButtonActive, () {
      super.isContinueButtonActive = value;
    });
  }

  final _$showCurrentIndexAnimationAtom =
      Atom(name: 'RecoverAccountControllerBase.showCurrentIndexAnimation');

  @override
  bool get showCurrentIndexAnimation {
    _$showCurrentIndexAnimationAtom.reportRead();
    return super.showCurrentIndexAnimation;
  }

  @override
  set showCurrentIndexAnimation(bool value) {
    _$showCurrentIndexAnimationAtom
        .reportWrite(value, super.showCurrentIndexAnimation, () {
      super.showCurrentIndexAnimation = value;
    });
  }

  final _$privateKeyErrorAtom =
      Atom(name: 'RecoverAccountControllerBase.privateKeyError');

  @override
  String? get privateKeyError {
    _$privateKeyErrorAtom.reportRead();
    return super.privateKeyError;
  }

  @override
  set privateKeyError(String? value) {
    _$privateKeyErrorAtom.reportWrite(value, super.privateKeyError, () {
      super.privateKeyError = value;
    });
  }

  final _$isInFirstViewAtom =
      Atom(name: 'RecoverAccountControllerBase.isInFirstView');

  @override
  bool get isInFirstView {
    _$isInFirstViewAtom.reportRead();
    return super.isInFirstView;
  }

  @override
  set isInFirstView(bool value) {
    _$isInFirstViewAtom.reportWrite(value, super.isInFirstView, () {
      super.isInFirstView = value;
    });
  }

  final _$isInSecondViewAtom =
      Atom(name: 'RecoverAccountControllerBase.isInSecondView');

  @override
  bool get isInSecondView {
    _$isInSecondViewAtom.reportRead();
    return super.isInSecondView;
  }

  @override
  set isInSecondView(bool value) {
    _$isInSecondViewAtom.reportWrite(value, super.isInSecondView, () {
      super.isInSecondView = value;
    });
  }

  final _$currentIndexAtom =
      Atom(name: 'RecoverAccountControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$tapContinueButtonAsyncAction =
      AsyncAction('RecoverAccountControllerBase.tapContinueButton');

  @override
  Future tapContinueButton(
      BuildContext context, String? privateKey, String? username) {
    return _$tapContinueButtonAsyncAction
        .run(() => super.tapContinueButton(context, privateKey, username));
  }

  final _$RecoverAccountControllerBaseActionController =
      ActionController(name: 'RecoverAccountControllerBase');

  @override
  void updateWidgetAnimations() {
    final _$actionInfo =
        _$RecoverAccountControllerBaseActionController.startAction(
            name: 'RecoverAccountControllerBase.updateWidgetAnimations');
    try {
      return super.updateWidgetAnimations();
    } finally {
      _$RecoverAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIndex(int index) {
    final _$actionInfo = _$RecoverAccountControllerBaseActionController
        .startAction(name: 'RecoverAccountControllerBase.updateIndex');
    try {
      return super.updateIndex(index);
    } finally {
      _$RecoverAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isContinueButtonActive: ${isContinueButtonActive},
showCurrentIndexAnimation: ${showCurrentIndexAnimation},
privateKeyError: ${privateKeyError},
isInFirstView: ${isInFirstView},
isInSecondView: ${isInSecondView},
currentIndex: ${currentIndex}
    ''';
  }
}
