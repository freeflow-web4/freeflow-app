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

  final _$viewStateAtom = Atom(name: 'WalletControllerBase.viewState');

  @override
  ViewState get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(ViewState value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
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

  final _$WalletControllerBaseActionController =
      ActionController(name: 'WalletControllerBase');

  @override
  List<String> getCategoryList(List<TranscriptEntity> transcripts) {
    final _$actionInfo = _$WalletControllerBaseActionController.startAction(
        name: 'WalletControllerBase.getCategoryList');
    try {
      return super.getCategoryList(transcripts);
    } finally {
      _$WalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
viewState: ${viewState},
viewContentType: ${viewContentType}
    ''';
  }
}
