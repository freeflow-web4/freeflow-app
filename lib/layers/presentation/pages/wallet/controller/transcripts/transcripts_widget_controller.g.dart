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

  final _$getTranscriptsAsyncAction =
      AsyncAction('TranscriptsWidgetControllerBase.getTranscripts');

  @override
  Future<void> getTranscripts() {
    return _$getTranscriptsAsyncAction.run(() => super.getTranscripts());
  }

  final _$refreshDataAsyncAction =
      AsyncAction('TranscriptsWidgetControllerBase.refreshData');

  @override
  Future<void> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  @override
  String toString() {
    return '''
transcriptViewState: ${transcriptViewState},
transcripts: ${transcripts}
    ''';
  }
}
