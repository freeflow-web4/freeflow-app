import 'dart:typed_data';

import 'package:freeflow/layers/data/dtos/edit_profile/edit_profile_dto.dart';

class EditProfileEntity {
  String username;
  Uint8List? image;

  EditProfileEntity({
    required this.username,
    this.image,
  });


  EditProfileDto toDto() => EditProfileDto(
    username: username,
    image: image,
  );


}
