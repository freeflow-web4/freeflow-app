import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/infra/http/dio_http_client_imp.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/dio_instance_mock.dart';

void main() async {
  late HttpClient dioHttpClient;
  late DioInstanceMock dioInstance;
  late String url;
  late Response response;

  setUp(() {
    dioInstance = DioInstanceMock();
    dioHttpClient = DioHttpClientImp(dioInstance);
    url = faker.internet.httpUrl();
    response = Response(requestOptions: RequestOptions(path: url));
  });

  test('should return a Response when get calls to the client succeed',
      () async {
    dioInstance.mockGetRequestSuccess(response);
    final result = await dioHttpClient.get(url);
    expect(result, isA<Response>());
    verify(() => dioInstance.get(url));
  });

  test('should return a Response when post calls to the client succeed',
      () async {
    dioInstance.mockPostRequestSuccess(response);
    final result = await dioHttpClient.post(url, body: {'teste': 'body'});
    expect(result, isA<Response>());
    verify(() => dioInstance.post(url, data: {'teste': 'body'}));
  });
}
