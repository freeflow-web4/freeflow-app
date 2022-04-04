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

  final _$transcriptListAtom =
      Atom(name: 'WalletControllerBase.transcriptList');

  @override
  ObservableList<Transcript> get transcriptList {
    _$transcriptListAtom.reportRead();
    return super.transcriptList;
  }

  @override
  set transcriptList(ObservableList<Transcript> value) {
    _$transcriptListAtom.reportWrite(value, super.transcriptList, () {
      super.transcriptList = value;
    });
  }

  final _$transcriptFilteredListAtom =
      Atom(name: 'WalletControllerBase.transcriptFilteredList');

  @override
  ObservableList<Transcript> get transcriptFilteredList {
    _$transcriptFilteredListAtom.reportRead();
    return super.transcriptFilteredList;
  }

  @override
  set transcriptFilteredList(ObservableList<Transcript> value) {
    _$transcriptFilteredListAtom
        .reportWrite(value, super.transcriptFilteredList, () {
      super.transcriptFilteredList = value;
    });
  }

  final _$categoryListAtom = Atom(name: 'WalletControllerBase.categoryList');

  @override
  List<String> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<String> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$WalletControllerBaseActionController =
      ActionController(name: 'WalletControllerBase');

  @override
  dynamic getTranscriptList() {
    final _$actionInfo = _$WalletControllerBaseActionController.startAction(
        name: 'WalletControllerBase.getTranscriptList');
    try {
      return super.getTranscriptList();
    } finally {
      _$WalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterTrasncript(String category) {
    final _$actionInfo = _$WalletControllerBaseActionController.startAction(
        name: 'WalletControllerBase.filterTrasncript');
    try {
      return super.filterTrasncript(category);
    } finally {
      _$WalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
transcriptList: ${transcriptList},
transcriptFilteredList: ${transcriptFilteredList},
categoryList: ${categoryList}
    ''';
  }
}
