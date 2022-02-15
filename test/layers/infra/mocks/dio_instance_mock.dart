import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class DioInstanceMock extends Mock implements Dio {
  When mockGetRequestCall() => when(() => get(any()));
  When mockPostRequestCall() =>
      when(() => post(any(), data: any(named: 'data')));

  void mockGetRequestSuccess(Response response) =>
      mockGetRequestCall().thenAnswer((_) async => response);
  void mockPostRequestSuccess(Response response) =>
      mockPostRequestCall().thenAnswer((_) async => response);
}
