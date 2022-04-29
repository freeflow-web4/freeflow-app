// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_show_phrase_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileShowPhraseController on ProfileShowPhraseControllerBase, Store {
  Computed<bool>? _$loadingIsNotCompletedComputed;

  @override
  bool get loadingIsNotCompleted => (_$loadingIsNotCompletedComputed ??=
          Computed<bool>(() => super.loadingIsNotCompleted,
              name: 'ProfileShowPhraseControllerBase.loadingIsNotCompleted'))
      .value;

  final _$privateKeyAtom =
      Atom(name: 'ProfileShowPhraseControllerBase.privateKey');

  @override
  String? get privateKey {
    _$privateKeyAtom.reportRead();
    return super.privateKey;
  }

  @override
  set privateKey(String? value) {
    _$privateKeyAtom.reportWrite(value, super.privateKey, () {
      super.privateKey = value;
    });
  }

  final _$pageStateAtom =
      Atom(name: 'ProfileShowPhraseControllerBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$getPrivateKeyAsyncAction =
      AsyncAction('ProfileShowPhraseControllerBase.getPrivateKey');

  @override
  Future<void> getPrivateKey({required Function onError}) {
    return _$getPrivateKeyAsyncAction
        .run(() => super.getPrivateKey(onError: onError));
  }

  @override
  String toString() {
    return '''
privateKey: ${privateKey},
pageState: ${pageState},
loadingIsNotCompleted: ${loadingIsNotCompleted}
    ''';
  }
}
