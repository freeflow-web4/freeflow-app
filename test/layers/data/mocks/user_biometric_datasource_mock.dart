import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:mocktail/mocktail.dart';

class UserBiometricDatasourceMock extends Mock
    implements UserBiometricsDataSource {
  When _mockRequestCall() => when(() => getHasBiometrics());
  void mockRequestSuccess(String value) =>
      _mockRequestCall().thenAnswer((_) async => value);
  void mockRequestFailure(String error) =>
      _mockRequestCall().thenThrow(Exception(error));

  When _mockSetRequestCall() => when(() => setHasBiometrics(any()));
  void mockSetRequestSuccess(String value) =>
      _mockSetRequestCall().thenAnswer((_) async => value);
  void mockSetRequestFailure(String error) =>
      _mockSetRequestCall().thenThrow(Exception(error));
}
