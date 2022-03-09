import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/user_has_biometric_repository_imp.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_has_biometric_repository.dart';

import '../mocks/user_has_biometric_datasource_mock.dart';

void main() {
  late UserHasBiometricDatasourceMock datasourceMock;
  late UserHasBiometricsRepository repository;

  setUp(() {
    datasourceMock = UserHasBiometricDatasourceMock();
    repository = UserHasBiometricsRepositoryImp(datasourceMock);
  });

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
}
