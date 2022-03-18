import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/remote/username_exists_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';

import '../mocks/dio_http_client_mock.dart';

void main() {
  late UsernameExistsDatasource dataSource;
  late DioHttpClientMock clientMock;
  late String username;
  late String url;

  setUp(() {
    clientMock = DioHttpClientMock();
    dataSource = UsernameExistsDatasourceImp(clientMock);
    username = faker.person.firstName();
    url = faker.internet.httpUrl();
  });

  test('should return true if username exists', () async {
    clientMock.mockGetRequestSuccess(
      Response(
        data: {"message": "USER_ALREADY_EXISTS"},
        requestOptions: RequestOptions(baseUrl: url, path: ''),
      ),
    );
    final result = await dataSource.getUsernameExists(username);
    expect(result, true);
  });

  test('should return false if username dont exists', () async {
    clientMock.mockGetRequestSuccess(
      Response(
        data: {"message": "OK"},
        requestOptions: RequestOptions(baseUrl: url, path: ''),
      ),
    );
    final result = await dataSource.getUsernameExists(username);
    expect(result, false);
  });
}
