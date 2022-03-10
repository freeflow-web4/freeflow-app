import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

class LocalAuthMock extends Mock implements LocalAuthentication {
  When _mockCanCheckBiometricsCall() => when(() => canCheckBiometrics);
  void mockCanCheckBiometricsSuccess(bool value) =>
      _mockCanCheckBiometricsCall().thenAnswer((_) async => value);
  void mockCanCheckBiometricsFailure() =>
      _mockCanCheckBiometricsCall().thenThrow(Exception());

  When _mockGetAvailableBiometricsCall() =>
      when(() => getAvailableBiometrics());
  void mockGetAvailableBiometricsSuccess(List<BiometricType> value) =>
      _mockGetAvailableBiometricsCall().thenAnswer((_) async => value);
  void mockGetAvailableBiometricsFailure() =>
      _mockGetAvailableBiometricsCall().thenThrow(Exception());

  When _mockAuthenticateCall() => when(() => authenticate(
        localizedReason: any(named: 'localizedReason'),
        stickyAuth: true,
        useErrorDialogs: true,
      ));
  void mockAuthenticateSuccess(bool value) =>
      _mockAuthenticateCall().thenAnswer((_) async => value);
  void mockAuthenticateFailure() =>
      _mockAuthenticateCall().thenThrow(Exception());
}
