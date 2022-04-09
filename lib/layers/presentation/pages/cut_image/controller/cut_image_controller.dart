import 'dart:typed_data';

import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'cut_image_controller.g.dart';

CutImageController findCutImageController() => GetIt.I.get<CutImageController>();

class CutImageController = _CutImageControllerBase with _$CutImageController;

abstract class _CutImageControllerBase with Store {

  @observable
  Uint8List? bytes;

  void onTapCancel()  {
    Routes.instance.pop();
  }

  Future<void> loadingImage(imageUrl) async {
    bytes = (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl)).buffer.asUint8List();
  }

  Future<Uint8List?> cutImage(GlobalKey _cropperKeyA)  async {
    Uint8List? imageBytes = await Cropper.crop(
      cropperKey: _cropperKeyA,
    );

    return imageBytes;
  }

  void backToEditProfile(Uint8List image){
    Routes.instance.backToEditProfile(image);
  }


}
