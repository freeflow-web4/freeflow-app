import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/user_profile_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_profile/user_profile_dto.dart';
import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UserProfileDataSourceImp implements UserProfileDataSource {
  final HttpClient client;
  UserProfileDataSourceImp(this.client);

  @override
  Future<bool> editProfile({required EditProfileEntity editProfileEntity}) async {
    try {
      final response = await client.put(
        'users',
        body: await editProfileEntity.toDto().toFormData(),
      );
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }

  @override
  Future<ProfileEntity> getProfile() async {
    try {
      final response = await client.get(
        'users',
      );

      final user = UserProfileDto.fromJson(response.data).toEntity();
      return user;
    } catch (error) {

      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }

}
