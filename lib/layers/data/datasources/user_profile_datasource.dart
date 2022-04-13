import 'dart:typed_data';

import 'package:freeflow/layers/domain/entities/profile_entity.dart';

abstract class UserProfileDataSource {

  Future<bool> editProfile({required String username,Uint8List? image,});

  Future<ProfileEntity> getProfile();
}
