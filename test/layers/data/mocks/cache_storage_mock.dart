import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:mocktail/mocktail.dart';

class CacheStorageMock extends Mock implements CacheStorage {
  When _mockGetRequestCall() => when(() => get(any()));
  void mockGetRequestSuccess(String value) =>
      _mockGetRequestCall().thenAnswer((_) async => value);
  void mockGetRequestFailure(String error) =>
      _mockGetRequestCall().thenThrow(Exception(error));

  When _mockSetRequestCall() =>
      when(() => save(key: any(named: 'key'), value: any(named: 'value')));
  void mockSetRequestSuccess() =>
      _mockSetRequestCall().thenAnswer((_) async => true);
  void mockSetRequestFailure(String error) =>
      _mockSetRequestCall().thenThrow(Exception(error));
}
