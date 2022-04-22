// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_exchange_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlowerExchangeController on _FlowerExchangeControllerBase, Store {
  final _$transcriptDetailsEntityAtom =
      Atom(name: '_FlowerExchangeControllerBase.transcriptDetailsEntity');

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

  final _$onTapFlowerExchangeAsyncAction =
      AsyncAction('_FlowerExchangeControllerBase.onTapFlowerExchange');

  @override
  Future<bool> onTapFlowerExchange(TranscriptEntity transcriptEntity) {
    return _$onTapFlowerExchangeAsyncAction
        .run(() => super.onTapFlowerExchange(transcriptEntity));
  }

  @override
  String toString() {
    return '''
transcriptDetailsEntity: ${transcriptDetailsEntity}
    ''';
  }
}
