import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:freeflow/layers/infra/handlers/image_to_file.dart';

class EditProfileDto {
  String username;
  Uint8List? image;

  EditProfileDto({ required this.username, this.image,});

  Future<FormData> toFormData() async {
    Map<String, dynamic> map = {
      "displayName": username,
    };

    if(image != null){
      File file = await uint8ListToFile(image!);
      map['file'] = getMultipartFile(file);
    }

    FormData formData = FormData.fromMap(map);

    return formData;
  }



}
