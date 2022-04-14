import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';

abstract class UserProfileDataSource {

  Future<bool> editProfile({required EditProfileEntity editProfileEntity});

  Future<ProfileEntity> getProfile();
}
