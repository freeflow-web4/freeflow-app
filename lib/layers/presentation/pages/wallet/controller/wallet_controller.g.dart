// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletController on WalletControllerBase, Store {
  final _$indexAtom = Atom(name: 'WalletControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$trasncriptViewStateAtom =
      Atom(name: 'WalletControllerBase.trasncriptViewState');

  @override
  ViewState get trasncriptViewState {
    _$trasncriptViewStateAtom.reportRead();
    return super.trasncriptViewState;
  }

  @override
  set trasncriptViewState(ViewState value) {
    _$trasncriptViewStateAtom.reportWrite(value, super.trasncriptViewState, () {
      super.trasncriptViewState = value;
    });
  }

  final _$walletViewStateAtom =
      Atom(name: 'WalletControllerBase.walletViewState');

  @override
  ViewState get walletViewState {
    _$walletViewStateAtom.reportRead();
    return super.walletViewState;
  }

  @override
  set walletViewState(ViewState value) {
    _$walletViewStateAtom.reportWrite(value, super.walletViewState, () {
      super.walletViewState = value;
    });
  }

  final _$viewContentTypeAtom =
      Atom(name: 'WalletControllerBase.viewContentType');

  @override
  ViewContentType get viewContentType {
    _$viewContentTypeAtom.reportRead();
    return super.viewContentType;
  }

  @override
  set viewContentType(ViewContentType value) {
    _$viewContentTypeAtom.reportWrite(value, super.viewContentType, () {
      super.viewContentType = value;
    });
  }

  final _$getTranscriptListAsyncAction =
      AsyncAction('WalletControllerBase.getTranscriptList');

  @override
  Future<List<TranscriptEntity>> getTranscriptList() {
    return _$getTranscriptListAsyncAction.run(() => super.getTranscriptList());
  }

  final _$refreshDataAsyncAction =
      AsyncAction('WalletControllerBase.refreshData');

  @override
  Future<void> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  @override
  String toString() {
    return '''
index: ${index},
trasncriptViewState: ${trasncriptViewState},
walletViewState: ${walletViewState},
viewContentType: ${viewContentType}
    ''';
  }
}
