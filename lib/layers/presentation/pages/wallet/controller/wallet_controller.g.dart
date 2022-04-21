// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletController on WalletControllerBase, Store {
  Computed<bool>? _$walletIsLoadingComputed;

  @override
  bool get walletIsLoading =>
      (_$walletIsLoadingComputed ??= Computed<bool>(() => super.walletIsLoading,
              name: 'WalletControllerBase.walletIsLoading'))
          .value;
  Computed<bool>? _$transcriptIsLoadingComputed;

  @override
  bool get transcriptIsLoading => (_$transcriptIsLoadingComputed ??=
          Computed<bool>(() => super.transcriptIsLoading,
              name: 'WalletControllerBase.transcriptIsLoading'))
      .value;
  Computed<bool>? _$isTranscriptErrorComputed;

  @override
  bool get isTranscriptError => (_$isTranscriptErrorComputed ??= Computed<bool>(
          () => super.isTranscriptError,
          name: 'WalletControllerBase.isTranscriptError'))
      .value;

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

  final _$WalletControllerBaseActionController =
      ActionController(name: 'WalletControllerBase');

  @override
  bool walletOrTranscripIsLoadingOrNull(
      List<TranscriptEntity>? transcriptList) {
    final _$actionInfo = _$WalletControllerBaseActionController.startAction(
        name: 'WalletControllerBase.walletOrTranscripIsLoadingOrNull');
    try {
      return super.walletOrTranscripIsLoadingOrNull(transcriptList);
    } finally {
      _$WalletControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
trasncriptViewState: ${trasncriptViewState},
walletViewState: ${walletViewState},
viewContentType: ${viewContentType},
walletIsLoading: ${walletIsLoading},
transcriptIsLoading: ${transcriptIsLoading},
isTranscriptError: ${isTranscriptError}
    ''';
  }
}
