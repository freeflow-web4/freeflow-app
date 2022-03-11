import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:mocktail/mocktail.dart';

class UserLocalAuthDatasourceMock extends Mock
    implements UserLocalAuthDatasource {
  When _mockGetRequestCall() => when(() => getUser());
  void mockGetRequestSuccess(UserLocalAuthEntity user) =>
      _mockGetRequestCall().thenAnswer((_) async => user);
  void mockGetRequestFailure() => _mockGetRequestCall().thenThrow(Exception());

  When _mockSaveRequestCall() => when(() => saveUser(any()));
  void mockSaveRequestSuccess() =>
      _mockSaveRequestCall().thenAnswer((_) async => true);
  void mockSaveRequestFailure() =>
      _mockSaveRequestCall().thenThrow(Exception());
}
