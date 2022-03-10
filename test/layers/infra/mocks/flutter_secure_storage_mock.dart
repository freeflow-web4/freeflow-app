import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {
  When _mockWriteRequestCall() =>
      when(() => write(key: any(named: 'key'), value: any(named: 'value')));
  void mockWriteRequestSuccess() =>
      _mockWriteRequestCall().thenAnswer((_) async => _);
  void mockWriteRequestFailure() =>
      _mockWriteRequestCall().thenThrow(Exception());

  When _mockReadRequestCall() => when(() => read(key: any(named: 'key')));
  void mockReadRequestSuccess(String data) =>
      _mockReadRequestCall().thenAnswer((_) async => data);
  void mockReadRequestFailure() =>
      _mockReadRequestCall().thenThrow(Exception());

  When _mockDeleteRequestCall() => when(() => delete(key: any(named: 'key')));
  void mockDeleteRequestSuccess() =>
      _mockDeleteRequestCall().thenAnswer((_) async => _);
  void mockDeleteRequestFailure() =>
      _mockDeleteRequestCall().thenThrow(Exception());
}
