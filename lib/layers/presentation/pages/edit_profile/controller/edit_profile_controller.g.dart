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

  final _$hasMorePhotosAtom =
      Atom(name: '_EditProfileControllerBase.hasMorePhotos');

  @override
  bool get hasMorePhotos {
    _$hasMorePhotosAtom.reportRead();
    return super.hasMorePhotos;
  }

  @override
  set hasMorePhotos(bool value) {
    _$hasMorePhotosAtom.reportWrite(value, super.hasMorePhotos, () {
      super.hasMorePhotos = value;
    });
  }

  final _$loadingMorePhotosAtom =
      Atom(name: '_EditProfileControllerBase.loadingMorePhotos');

  @override
  bool get loadingMorePhotos {
    _$loadingMorePhotosAtom.reportRead();
    return super.loadingMorePhotos;
  }

  @override
  set loadingMorePhotos(bool value) {
    _$loadingMorePhotosAtom.reportWrite(value, super.loadingMorePhotos, () {
      super.loadingMorePhotos = value;
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

  final _$controllerNameAtom =
      Atom(name: '_EditProfileControllerBase.controllerName');

  @override
  TextEditingController get controllerName {
    _$controllerNameAtom.reportRead();
    return super.controllerName;
  }

  @override
  set controllerName(TextEditingController value) {
    _$controllerNameAtom.reportWrite(value, super.controllerName, () {
      super.controllerName = value;
    });
  }

  final _$imagesAtom = Atom(name: '_EditProfileControllerBase.images');

  @override
  List<CollectiblesEntity> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<CollectiblesEntity> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$saveProfileAsyncAction =
      AsyncAction('_EditProfileControllerBase.saveProfile');

  @override
  Future saveProfile(ProfileEntity profileEntity) {
    return _$saveProfileAsyncAction.run(() => super.saveProfile(profileEntity));
  }

  final _$getCollectiblesAsyncAction =
      AsyncAction('_EditProfileControllerBase.getCollectibles');

  @override
  Future<void> getCollectibles() {
    return _$getCollectiblesAsyncAction.run(() => super.getCollectibles());
  }

  final _$getMoreCollectiblesAsyncAction =
      AsyncAction('_EditProfileControllerBase.getMoreCollectibles');

  @override
  Future<void> getMoreCollectibles() {
    return _$getMoreCollectiblesAsyncAction
        .run(() => super.getMoreCollectibles());
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
  dynamic dispose() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
invalidName: ${invalidName},
loadingPhotos: ${loadingPhotos},
hasMorePhotos: ${hasMorePhotos},
loadingMorePhotos: ${loadingMorePhotos},
imageBytes: ${imageBytes},
navigatorKey: ${navigatorKey},
controllerName: ${controllerName},
images: ${images}
    ''';
  }
}
