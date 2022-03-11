import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver_imp.dart';
import 'package:local_auth/local_auth.dart';

import '../mocks/local_auth_mock.dart';

void main() {
  late LocalAuthMock localAuthMock;
  late BiometricAuthDriver biometricDriver;
  late List<BiometricType> biometricTypes;

  setUp(() {
    localAuthMock = LocalAuthMock();
    biometricDriver = BiometricAuthDriverImp(localAuthMock);
    biometricTypes = [BiometricType.face, BiometricType.fingerprint];
  });

  group('is biometric available', () {
    test('should return true if biometrics is available', () async {
      localAuthMock.mockCanCheckBiometricsSuccess(true);
      final result = await biometricDriver.isBiometricAvailable();
      expect(result, const Right(true));
    });

    test('should return false if biometric is not available', () async {
      localAuthMock.mockCanCheckBiometricsSuccess(true);
      final result = await biometricDriver.isBiometricAvailable();
      expect(result, const Right(true));
    });

    test('should return a DomainError if LocalAuth throws an Exception',
        () async {
      localAuthMock.mockCanCheckBiometricsFailure();
      final result = await biometricDriver.isBiometricAvailable();
      expect(result, const Left(DomainError.somethingWrong));
    });
  });

  group('get available biometrics', () {
    test('should return the correct list', () async {
      localAuthMock.mockGetAvailableBiometricsSuccess(biometricTypes);
      final result = await biometricDriver.getAvailableBiometrics();
      expect(result, Right(biometricTypes));
    });

    test('should return a DomainError if LocalAuth throws an Exception',
        () async {
      localAuthMock.mockGetAvailableBiometricsFailure();
      final result = await biometricDriver.getAvailableBiometrics();
      expect(result, const Left(DomainError.somethingWrong));
    });
  });

  group('authenticate', () {
    test('should return true if user has been authenticated', () async {
      localAuthMock.mockCanCheckBiometricsSuccess(true);
      localAuthMock.mockAuthenticateSuccess(true);
      final result = await biometricDriver.authenticateUser();
      expect(result, const Right(true));
    });
    test('should return false if user has not been authenticated', () async {
      localAuthMock.mockCanCheckBiometricsSuccess(true);
      localAuthMock.mockAuthenticateSuccess(false);
      final result = await biometricDriver.authenticateUser();
      expect(result, const Right(false));
    });
    test('should return a DomainError if it has not biometrics', () async {
      localAuthMock.mockCanCheckBiometricsSuccess(false);
      final result = await biometricDriver.getAvailableBiometrics();
      expect(result, const Left(DomainError.somethingWrong));
    });
  });
}
