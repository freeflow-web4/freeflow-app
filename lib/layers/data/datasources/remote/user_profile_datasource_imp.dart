import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/dtos/user_profile/user_profile_dto.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import '../user_profile_datasource.dart';

class UserProfileDataSourceImp implements UserProfileDataSource {
  final HttpClient client;
  UserProfileDataSourceImp(this.client);

  @override
  Future<bool> editProfile({required String username, String? image}) async {
    try {
      final response = await client.post(
        'users',
        body: {
          "displayName": username,
          "file": image,
        },
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
      print('ariel');
      final response = await client.get(
        'users',
      );
      print('ariel');

      final user = UserProfileDto.fromJson(response.data).toEntity();
      return user;
    } catch (error) {
      print('error ariel $error');

      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }

}
