import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/remote/user_recover_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';

import '../mocks/dio_http_client_mock.dart';

void main() {
  late UserRecoverLoginDataSource dataSource;
  late DioHttpClientMock clientMock;
  late String username;
  late String privateKey;
  late String url;
  late UserEntity userEntity;
  late String responseEntity;

  setUp(() {
    clientMock = DioHttpClientMock();
    dataSource = UserRecoverLoginDataSourceImp(clientMock);
    username = faker.person.firstName();
    privateKey = faker.lorem.sentence();
    url = faker.internet.httpUrl();
    userEntity = UserEntity(
      id: "id",
      username: "username",
      email: "email",
      token: "token",
    );
    responseEntity =
        jsonEncode(UserRecoverLoginDto.fromEntity(userEntity).toJson());
  });

  test('should return a UserEntity when succeed', () async {
    clientMock.mockPostRequestSuccess(
      Response(
        data: responseEntity,
        requestOptions: RequestOptions(baseUrl: url, path: ''),
      ),
    );
    final result = await dataSource.recover(
      username: username,
      privateKey: privateKey,
    );
    expect(result, isA<UserEntity>());
  });

  test('should throw an Exception when dont succeed', () async {
    clientMock.mockPostRequestFailure('error');
    expect(
        () => dataSource.recover(
              username: username,
              privateKey: privateKey,
            ),
        throwsException);
  });
}
