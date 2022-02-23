// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullscreen_alert_dialog_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FullscreenAlertDialogController
    on FullscreenAlertDialogControllerBase, Store {
  final _$showCloseButtonAtom =
      Atom(name: 'FullscreenAlertDialogControllerBase.showCloseButton');

  @override
  bool get showCloseButton {
    _$showCloseButtonAtom.reportRead();
    return super.showCloseButton;
  }

  @override
  set showCloseButton(bool value) {
    _$showCloseButtonAtom.reportWrite(value, super.showCloseButton, () {
      super.showCloseButton = value;
    });
  }

  final _$isCloseButtonAnimatingAtom =
      Atom(name: 'FullscreenAlertDialogControllerBase.isCloseButtonAnimating');

  @override
  bool get isCloseButtonAnimating {
    _$isCloseButtonAnimatingAtom.reportRead();
    return super.isCloseButtonAnimating;
  }

  @override
  set isCloseButtonAnimating(bool value) {
    _$isCloseButtonAnimatingAtom
        .reportWrite(value, super.isCloseButtonAnimating, () {
      super.isCloseButtonAnimating = value;
    });
  }

  final _$FullscreenAlertDialogControllerBaseActionController =
      ActionController(name: 'FullscreenAlertDialogControllerBase');

  @override
  void updateWidgetAnimations() {
    final _$actionInfo =
        _$FullscreenAlertDialogControllerBaseActionController.startAction(
            name: 'FullscreenAlertDialogControllerBase.updateWidgetAnimations');
    try {
      return super.updateWidgetAnimations();
    } finally {
      _$FullscreenAlertDialogControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showCloseButton: ${showCloseButton},
isCloseButtonAnimating: ${isCloseButtonAnimating}
    ''';
  }
}
