import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/cache/user_local_auth_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';

import '../mocks/cache_storage_mock.dart';

void main() {
  late UserLocalAuthDatasource dataSource;
  late CacheStorageMock cacheStorageMock;
  late UserEntity entity;
  late String entityString;

  setUp(() {
    cacheStorageMock = CacheStorageMock();
    dataSource = UserLocalAuthDatasourceImp(cacheStorageMock);
    entity = UserEntity(
      email: 'email',
      id: 'id',
      token: '123',
      username: 'username',
    );
    entityString = jsonEncode(UserRecoverLoginDto.fromEntity(entity).toJson());
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
    test('should return an UserEntity if succeed', () async {
      cacheStorageMock.mockGetRequestSuccess(entityString);
      final result = await dataSource.getUser();
      expect(result, isA<UserEntity>());
    });

    test('should throw an Exception if dont succeed ', () async {
      cacheStorageMock.mockGetRequestFailure('Cache error!');
      expect(() => dataSource.getUser(), throwsException);
    });
  });
}
