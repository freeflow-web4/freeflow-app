import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/cache/user_local_auth_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_local_auth/user_local_auth_dto.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';

import '../mocks/cache_storage_mock.dart';

void main() {
  late UserLocalAuthDatasource dataSource;
  late CacheStorageMock cacheStorageMock;
  late UserLocalAuthEntity entity;
  late String entityString;

  setUp(() {
    cacheStorageMock = CacheStorageMock();
    dataSource = UserLocalAuthDatasourceImp(cacheStorageMock);
    entity = UserLocalAuthEntity(hasBiometrics: true, pinCode: '1234');
    entityString = jsonEncode(UserLocalAuthDto.fromEntity(entity).toJson());
  });

  group('save local auth user', () {
    test('should return true if user has been saved', () async {
      cacheStorageMock.mockSetRequestSuccess();
      final result = await dataSource.saveUser(entity);
      expect(result, true);
    });

    test('should throw an Exception if dont succeed ', () async {
      cacheStorageMock.mockSetRequestFailure('Cache error!');
      final result = dataSource.saveUser(entity);
      expect(result, throwsA(isA<Exception>()));
    });
  });

  group('get local auth user', () {
    test('should return the correct entity', () async {
      cacheStorageMock.mockGetRequestSuccess(entityString);
      final result = await dataSource.getUser();
      expect(result.hasBiometrics, entity.hasBiometrics);
      expect(result.pinCode, entity.pinCode);
    });
    test('should return an UserLocalAuthEntity', () async {
      cacheStorageMock.mockGetRequestSuccess(entityString);
      final result = await dataSource.getUser();
      expect(result, isA<UserLocalAuthEntity>());
    });

    test('should throw an Exception if dont succeed ', () async {
      cacheStorageMock.mockGetRequestFailure('Cache error!');
      final result = dataSource.getUser();
      expect(result, throwsA(isA<Exception>()));
    });
  });
}
