import 'package:freeflow/layers/data/datasources/user_has_biometric_datasource.dart';
import 'package:mocktail/mocktail.dart';

class UserHasBiometricDatasourceMock extends Mock
    implements UserHasBiometricsDataSource {
  When _mockRequestCall() => when(() => getHasBiometrics());

  void mockRequestSuccess(bool value) =>
      _mockRequestCall().thenAnswer((_) async => value);
  void mockRequestFailure(String error) =>
      _mockRequestCall().thenThrow(Exception(error));
}
