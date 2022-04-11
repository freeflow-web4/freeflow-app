
import 'package:freeflow/layers/domain/entities/profile_entity.dart';

abstract class UserProfileDataSource {

  Future<bool> editProfile({required String username, String? image,});

  Future<ProfileEntity> getProfile();
}
