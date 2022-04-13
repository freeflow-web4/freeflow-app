import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/user_profile_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_profile/user_profile_dto.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UserProfileDataSourceImp implements UserProfileDataSource {
  final HttpClient client;
  UserProfileDataSourceImp(this.client);

  @override
  Future<bool> editProfile({required String username, Uint8List? image}) async {
    try {
      Map<String, dynamic> body = {
        "displayName": username,
      };




      File? file;
        if (image != null) {
          file = File.fromRawPath(image);
          body['file'] = file;
        }

      print('body $body');



      final response = await client.post(
        'users',
        body: body,
      );
      if(response.statusCode == 200){
        print('status - ${response.data}');
        return true;
      }
      print('status - ${response.data}');
      print('status - ${response.statusCode}');

      return false;

    } catch (error) {
      print('error: $error');
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
