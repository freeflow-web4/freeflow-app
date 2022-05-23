// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcripts_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TranscriptsWidgetController on TranscriptsWidgetControllerBase, Store {
  final _$transcriptViewStateAtom =
      Atom(name: 'TranscriptsWidgetControllerBase.transcriptViewState');

  @override
  ViewState get transcriptViewState {
    _$transcriptViewStateAtom.reportRead();
    return super.transcriptViewState;
  }

  @override
  set transcriptViewState(ViewState value) {
    _$transcriptViewStateAtom.reportWrite(value, super.transcriptViewState, () {
      super.transcriptViewState = value;
    });
  }

  final _$transcriptsAtom =
      Atom(name: 'TranscriptsWidgetControllerBase.transcripts');

  @override
  List<TranscriptEntity> get transcripts {
    _$transcriptsAtom.reportRead();
    return super.transcripts;
  }

  @override
  set transcripts(List<TranscriptEntity> value) {
    _$transcriptsAtom.reportWrite(value, super.transcripts, () {
      super.transcripts = value;
    });
  }

  final _$loadingMoreTranscriptsAtom =
      Atom(name: 'TranscriptsWidgetControllerBase.loadingMoreTranscripts');

  @override
  bool get loadingMoreTranscripts {
    _$loadingMoreTranscriptsAtom.reportRead();
    return super.loadingMoreTranscripts;
  }

  @override
  set loadingMoreTranscripts(bool value) {
    _$loadingMoreTranscriptsAtom
        .reportWrite(value, super.loadingMoreTranscripts, () {
      super.loadingMoreTranscripts = value;
    });
  }

  final _$hasMoreTranscriptsAtom =
      Atom(name: 'TranscriptsWidgetControllerBase.hasMoreTranscripts');

  @override
  bool get hasMoreTranscripts {
    _$hasMoreTranscriptsAtom.reportRead();
    return super.hasMoreTranscripts;
  }

  @override
  set hasMoreTranscripts(bool value) {
    _$hasMoreTranscriptsAtom.reportWrite(value, super.hasMoreTranscripts, () {
      super.hasMoreTranscripts = value;
    });
  }

  final _$hasConnectionAtom =
      Atom(name: 'TranscriptsWidgetControllerBase.hasConnection');

  @override
  bool get hasConnection {
    _$hasConnectionAtom.reportRead();
    return super.hasConnection;
  }

  @override
  set hasConnection(bool value) {
    _$hasConnectionAtom.reportWrite(value, super.hasConnection, () {
      super.hasConnection = value;
    });
  }

  final _$configureTranscriptsAsyncAction =
      AsyncAction('TranscriptsWidgetControllerBase.configureTranscripts');

  @override
  Future<void> configureTranscripts() {
    return _$configureTranscriptsAsyncAction
        .run(() => super.configureTranscripts());
  }

  final _$configureMoreTranscriptsAsyncAction =
      AsyncAction('TranscriptsWidgetControllerBase.configureMoreTranscripts');

  @override
  Future<void> configureMoreTranscripts() {
    return _$configureMoreTranscriptsAsyncAction
        .run(() => super.configureMoreTranscripts());
  }

  final _$refreshDataAsyncAction =
      AsyncAction('TranscriptsWidgetControllerBase.refreshData');

  @override
  Future<void> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  final _$TranscriptsWidgetControllerBaseActionController =
      ActionController(name: 'TranscriptsWidgetControllerBase');

  @override
  void setStatusConnection(ConnectivityResult result) {
    final _$actionInfo =
        _$TranscriptsWidgetControllerBaseActionController.startAction(
            name: 'TranscriptsWidgetControllerBase.setStatusConnection');
    try {
      return super.setStatusConnection(result);
    } finally {
      _$TranscriptsWidgetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transcriptViewState: ${transcriptViewState},
transcripts: ${transcripts},
loadingMoreTranscripts: ${loadingMoreTranscripts},
hasMoreTranscripts: ${hasMoreTranscripts},
hasConnection: ${hasConnection}
    ''';
  }
}
