// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gratitude_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GratitudeController on _GratitudeControllerBase, Store {
  final _$transcriptDetailsEntityAtom =
      Atom(name: '_GratitudeControllerBase.transcriptDetailsEntity');

  @override
  TranscriptDetailsEntity? get transcriptDetailsEntity {
    _$transcriptDetailsEntityAtom.reportRead();
    return super.transcriptDetailsEntity;
  }

  @override
  set transcriptDetailsEntity(TranscriptDetailsEntity? value) {
    _$transcriptDetailsEntityAtom
        .reportWrite(value, super.transcriptDetailsEntity, () {
      super.transcriptDetailsEntity = value;
    });
  }

  final _$loadingAtom = Atom(name: '_GratitudeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$onTapGratitudeAsyncAction =
      AsyncAction('_GratitudeControllerBase.onTapGratitude');

  @override
  Future<bool> onTapGratitude(TranscriptEntity transcriptEntity) {
    return _$onTapGratitudeAsyncAction
        .run(() => super.onTapGratitude(transcriptEntity));
  }

  @override
  String toString() {
    return '''
transcriptDetailsEntity: ${transcriptDetailsEntity},
loading: ${loading}
    ''';
  }
}
