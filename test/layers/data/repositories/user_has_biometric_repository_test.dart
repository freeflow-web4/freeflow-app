import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/user_biometrics_repository_imp.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';

import '../mocks/user_biometric_datasource_mock.dart';

void main() {
  late UserBiometricDatasourceMock datasourceMock;
  late UserBiometricsRepository repository;

  setUp(() {
    datasourceMock = UserBiometricDatasourceMock();
    repository = UserHasBiometricsRepositoryImp(datasourceMock);
  });

  group('get has biometrics', () {
    test('should return true if user has biometrics', () async {
      datasourceMock.mockRequestSuccess(true);
      final result = await repository.getHasBiometrics();
      expect(result, const Right(true));
    });

    test('should return false if user has not biometrics', () async {
      datasourceMock.mockRequestSuccess(false);
      final result = await repository.getHasBiometrics();
      expect(result, const Right(false));
    });

    test(
        'should return a Domain error when calls to datasource throws an exception',
        () async {
      datasourceMock.mockRequestFailure('Cache error!');
      final result = await repository.getHasBiometrics();
      expect(result, const Left(DomainError.cacheError));
    });
  });

  group('set has biometrics', () {
    test('should return true if set biometrics to true', () async {
      datasourceMock.mockSetRequestSuccess(true);
      final result = await repository.setHasBiometrics(true);
      expect(result, const Right(true));
    });

    test('should return false if set biometrics to false', () async {
      datasourceMock.mockSetRequestSuccess(false);
      final result = await repository.setHasBiometrics(false);
      expect(result, const Right(false));
    });

    test(
        'should return a Domain error when calls to datasource throws an exception',
        () async {
      datasourceMock.mockSetRequestFailure('Cache error!');
      final result = await repository.setHasBiometrics(true);
      expect(result, const Left(DomainError.cacheError));
    });
  });
}
