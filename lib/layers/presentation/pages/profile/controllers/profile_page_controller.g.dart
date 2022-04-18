// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfilePageController on ProfilePageControllerBase, Store {
  Computed<bool>? _$loadingIsNotCompletedComputed;

  @override
  bool get loadingIsNotCompleted => (_$loadingIsNotCompletedComputed ??=
          Computed<bool>(() => super.loadingIsNotCompleted,
              name: 'ProfilePageControllerBase.loadingIsNotCompleted'))
      .value;

  final _$userAtom = Atom(name: 'ProfilePageControllerBase.user');

  @override
  ProfileEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ProfileEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$pageStateAtom = Atom(name: 'ProfilePageControllerBase.pageState');

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

  final _$getUserAsyncAction = AsyncAction('ProfilePageControllerBase.getUser');

  @override
  Future<void> getUser({required Function onError}) {
    return _$getUserAsyncAction.run(() => super.getUser(onError: onError));
  }

  @override
  String toString() {
    return '''
user: ${user},
pageState: ${pageState},
loadingIsNotCompleted: ${loadingIsNotCompleted}
    ''';
  }
}
