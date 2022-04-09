// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileController on _EditProfileControllerBase, Store {
  final _$hasImageAtom = Atom(name: '_EditProfileControllerBase.hasImage');

  @override
  bool get hasImage {
    _$hasImageAtom.reportRead();
    return super.hasImage;
  }

  @override
  set hasImage(bool value) {
    _$hasImageAtom.reportWrite(value, super.hasImage, () {
      super.hasImage = value;
    });
  }

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

  final _$loadingSendDataAtom =
      Atom(name: '_EditProfileControllerBase.loadingSendData');

  @override
  bool get loadingSendData {
    _$loadingSendDataAtom.reportRead();
    return super.loadingSendData;
  }

  @override
  set loadingSendData(bool value) {
    _$loadingSendDataAtom.reportWrite(value, super.loadingSendData, () {
      super.loadingSendData = value;
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

  final _$itemSelectedAtom =
      Atom(name: '_EditProfileControllerBase.itemSelected');

  @override
  int get itemSelected {
    _$itemSelectedAtom.reportRead();
    return super.itemSelected;
  }

  @override
  set itemSelected(int value) {
    _$itemSelectedAtom.reportWrite(value, super.itemSelected, () {
      super.itemSelected = value;
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

  @override
  String toString() {
    return '''
hasImage: ${hasImage},
invalidName: ${invalidName},
loadingSendData: ${loadingSendData},
loadingPhotos: ${loadingPhotos},
itemSelected: ${itemSelected},
imageBytes: ${imageBytes}
    ''';
  }
}
