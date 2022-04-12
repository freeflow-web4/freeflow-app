// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileController on _EditProfileControllerBase, Store {
  final _$invalidNameAtom =
      Atom(name: '_EditProfileControllerBase.invalidName');

  @override
  String? get invalidName {
    _$invalidNameAtom.reportRead();
    return super.invalidName;
  }

  @override
  set invalidName(String? value) {
    _$invalidNameAtom.reportWrite(value, super.invalidName, () {
      super.invalidName = value;
    });
  }

  final _$loadingPhotosAtom =
      Atom(name: '_EditProfileControllerBase.loadingPhotos');

  @override
  bool get loadingPhotos {
    _$loadingPhotosAtom.reportRead();
    return super.loadingPhotos;
  }

  @override
  set loadingPhotos(bool value) {
    _$loadingPhotosAtom.reportWrite(value, super.loadingPhotos, () {
      super.loadingPhotos = value;
    });
  }

  final _$imageBytesAtom = Atom(name: '_EditProfileControllerBase.imageBytes');

  @override
  Uint8List? get imageBytes {
    _$imageBytesAtom.reportRead();
    return super.imageBytes;
  }

  @override
  set imageBytes(Uint8List? value) {
    _$imageBytesAtom.reportWrite(value, super.imageBytes, () {
      super.imageBytes = value;
    });
  }

  final _$userAtom = Atom(name: '_EditProfileControllerBase.user');

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

  final _$_pageStateAtom = Atom(name: '_EditProfileControllerBase._pageState');

  @override
  PageState get _pageState {
    _$_pageStateAtom.reportRead();
    return super._pageState;
  }

  @override
  set _pageState(PageState value) {
    _$_pageStateAtom.reportWrite(value, super._pageState, () {
      super._pageState = value;
    });
  }

  final _$_photoSelectedStateAtom =
      Atom(name: '_EditProfileControllerBase._photoSelectedState');

  @override
  PhotoSelectedState get _photoSelectedState {
    _$_photoSelectedStateAtom.reportRead();
    return super._photoSelectedState;
  }

  @override
  set _photoSelectedState(PhotoSelectedState value) {
    _$_photoSelectedStateAtom.reportWrite(value, super._photoSelectedState, () {
      super._photoSelectedState = value;
    });
  }

  final _$navigatorKeyAtom =
      Atom(name: '_EditProfileControllerBase.navigatorKey');

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

  final _$getUserAsyncAction =
      AsyncAction('_EditProfileControllerBase.getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$onTapToChangePhotoAsyncAction =
      AsyncAction('_EditProfileControllerBase.onTapToChangePhoto');

  @override
  Future<void> onTapToChangePhoto(String urlImage) {
    return _$onTapToChangePhotoAsyncAction
        .run(() => super.onTapToChangePhoto(urlImage));
  }

  final _$_EditProfileControllerBaseActionController =
      ActionController(name: '_EditProfileControllerBase');

  @override
  bool validateName(dynamic text, dynamic context) {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.validateName');
    try {
      return super.validateName(text, context);
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
invalidName: ${invalidName},
loadingPhotos: ${loadingPhotos},
imageBytes: ${imageBytes},
user: ${user},
navigatorKey: ${navigatorKey}
    ''';
  }
}
