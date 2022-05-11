import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UserRecoverLoginDataSourceImp implements UserRecoverLoginDataSource {
  final HttpClient client;
  UserRecoverLoginDataSourceImp(this.client);
  @override
  Future<UserEntity> recover(
      {required String username, required String privateKey,}) async {
    try {
      final response = await client.post(
        'users/recover',
        body: {
          "login": username,
          "seedPhrase": privateKey,
        },
      );
      final user = UserRecoverLoginDto.fromJson(response.data).toEntity();
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
