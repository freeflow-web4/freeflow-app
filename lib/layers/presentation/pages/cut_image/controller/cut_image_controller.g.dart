// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cut_image_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CutImageController on _CutImageControllerBase, Store {
  final _$bytesAtom = Atom(name: '_CutImageControllerBase.bytes');

  @override
  Uint8List? get bytes {
    _$bytesAtom.reportRead();
    return super.bytes;
  }

  @override
  set bytes(Uint8List? value) {
    _$bytesAtom.reportWrite(value, super.bytes, () {
      super.bytes = value;
    });
  }

  final _$navigatorKeyAtom = Atom(name: '_CutImageControllerBase.navigatorKey');

  @override
  GlobalKey<State<StatefulWidget>> get navigatorKey {
    _$navigatorKeyAtom.reportRead();
    return super.navigatorKey;
  }

  @override
  set navigatorKey(GlobalKey<State<StatefulWidget>> value) {
    _$navigatorKeyAtom.reportWrite(value, super.navigatorKey, () {
      super.navigatorKey = value;
    });
  }

  @override
  String toString() {
    return '''
bytes: ${bytes},
navigatorKey: ${navigatorKey}
    ''';
  }
}
