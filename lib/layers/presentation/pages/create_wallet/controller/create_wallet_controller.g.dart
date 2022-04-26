// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWalletController on _CreateWalletControllerBase, Store {
  final _$pageIndicatorHeightAtom =
      Atom(name: '_CreateWalletControllerBase.pageIndicatorHeight');

  @override
  double get pageIndicatorHeight {
    _$pageIndicatorHeightAtom.reportRead();
    return super.pageIndicatorHeight;
  }

  @override
  set pageIndicatorHeight(double value) {
    _$pageIndicatorHeightAtom.reportWrite(value, super.pageIndicatorHeight, () {
      super.pageIndicatorHeight = value;
    });
  }

  final _$_CreateWalletControllerBaseActionController =
      ActionController(name: '_CreateWalletControllerBase');

  @override
  void updatePageIndicatorHeight(double height) {
    final _$actionInfo =
        _$_CreateWalletControllerBaseActionController.startAction(
            name: '_CreateWalletControllerBase.updatePageIndicatorHeight');
    try {
      return super.updatePageIndicatorHeight(height);
    } finally {
      _$_CreateWalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndicatorHeight: ${pageIndicatorHeight}
    ''';
  }
}
