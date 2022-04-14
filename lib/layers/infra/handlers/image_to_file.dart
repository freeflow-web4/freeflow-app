import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<File> uint8ListToFile(Uint8List image) async {
  Uint8List imageInUnit8List = image;// store unit8List image here ;
  final tempDir = await getTemporaryDirectory();
  File file = await File('${tempDir.path}/image.png').create();
  file.writeAsBytesSync(imageInUnit8List);
  return file;
}

Future<MultipartFile> getMultipartFile(File file) async {
  String fileName = file.path.split('/').last;
  return   await MultipartFile.fromFile(
    file.path,
    filename: fileName,
  );
}