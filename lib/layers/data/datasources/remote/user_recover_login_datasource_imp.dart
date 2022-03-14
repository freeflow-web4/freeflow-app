import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UserRecoverLoginDataSourceImp implements UserRecoverLoginDataSource {
  final HttpClient client;
  UserRecoverLoginDataSourceImp(this.client);
  @override
  Future<UserEntity> call(
      {required String username, required String privateKey}) async {
    final response = await client.post(
      'users/recover',
      body: {
        "login": username,
        "seedPhrase": privateKey,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      final user = UserRecoverLoginDto.fromJson(json).toEntity();
      return user;
    } else {
      throw Exception(response.data);
    }
  }
}
