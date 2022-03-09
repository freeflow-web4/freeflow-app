import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/cache/user_biometric_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';

import '../mocks/cache_storage_mock.dart';

void main() {
  late UserBiometricsDataSource dataSource;
  late CacheStorageMock cacheStorageMock;

  setUp(() {
    cacheStorageMock = CacheStorageMock();
    dataSource = UserBiometricsDatasourceImp(cacheStorageMock);
  });

  group('set biometrics', () {
    test('should return true if user set biometrics true', () async {
      cacheStorageMock.mockSetRequestSuccess();
      final result = await dataSource.setHasBiometrics(true);
      expect(result, true);
    });

    test('should return false if user set biometrics false', () async {
      cacheStorageMock.mockSetRequestSuccess();
      final result = await dataSource.setHasBiometrics(false);
      expect(result, false);
    });

    test('should return exception if cache throws an exception', () async {
      cacheStorageMock.mockSetRequestFailure('Cache error!');
      expect(dataSource.setHasBiometrics(true), throwsA(isA<Exception>()));
    });
  });
  group('get biometrics', () {
    test('should return true if user have biometrics enabled', () async {
      cacheStorageMock.mockGetRequestSuccess(true);
      final result = await dataSource.getHasBiometrics();
      expect(result, true);
    });

    test('should return false if user have biometrics disabled', () async {
      cacheStorageMock.mockGetRequestSuccess(false);
      final result = await dataSource.getHasBiometrics();
      expect(result, false);
    });

    test('should return exception if cache throws an exception', () async {
      cacheStorageMock.mockGetRequestFailure('Cache error!');
      expect(dataSource.getHasBiometrics(), throwsA(isA<Exception>()));
    });
  });
}
