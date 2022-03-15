import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UsernameExistsDatasourceImp implements UsernameExistsDatasource {
  final HttpClient client;
  UsernameExistsDatasourceImp(this.client);
  @override
  Future<bool> getUsernameExists(String username) async {
    try {
      final response = await client.get("users/$username/exists");
      if (response.data == "USER_ALREADY_EXISTS") {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.response!.statusMessage);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
