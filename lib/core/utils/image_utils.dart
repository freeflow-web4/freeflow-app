import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static Future<ui.Image> loadImage(String path) async {
    var completer = Completer<ImageInfo>();
    var img = NetworkImage(path);
    img
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }

  static Future<ui.Image> loadAndResizeImage(String path,
      {int? width, int? height}) async {
    Response response = await (Dio()).get(
      path,
      options:
          Options(responseType: ResponseType.bytes, followRedirects: false),
    );
    var originalUnit8List = response.data as List<int>;
    var unitList = Uint8List.fromList(originalUnit8List);
    var codec = await ui.instantiateImageCodec(
      unitList,
      targetWidth: width,
      targetHeight: height,
    );
    var frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}
