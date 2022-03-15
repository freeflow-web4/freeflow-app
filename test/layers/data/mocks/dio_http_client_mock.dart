import 'package:dio/dio.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

class DioHttpClientMock extends Mock implements HttpClient {
  When _mockGetRequestCall() => when(() => get(any()));
  void mockGetRequestSuccess(String value) =>
      _mockGetRequestCall().thenAnswer((_) async => value);
  void mockGetRequestFailure(String error) =>
      _mockGetRequestCall().thenThrow(Exception(error));

  When _mockPostRequestCall() =>
      when(() => post(any(), body: any(named: "body")));
  void mockPostRequestSuccess(Response response) =>
      _mockPostRequestCall().thenAnswer((invocation) async => response);
  void mockPostRequestFailure(String error) =>
      _mockGetRequestCall().thenThrow(Exception(error));
}
